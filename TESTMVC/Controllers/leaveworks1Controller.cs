using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using TESTMVC.Models;

namespace TESTMVC.Controllers
{
    public class leaveworks1Controller : ApiController
    {
        private LeaveEntities db = new LeaveEntities();

        // GET: api/leaveworks1
        public IQueryable<leavework> Getleaveworks()
        {
            return db.leaveworks;
        }

        // GET: api/leaveworks1/5
        [ResponseType(typeof(leavework))]
        public IHttpActionResult Getleavework(int id)
        {
            leavework leavework = db.leaveworks.Find(id);
            if (leavework == null)
            {
                return NotFound();
            }

            return Ok(leavework);
        }

        // PUT: api/leaveworks1/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putleavework(int id, leavework leavework)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != leavework.Leave_Id)
            {
                return BadRequest();
            }

            db.Entry(leavework).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!leaveworkExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/leaveworks1
        [ResponseType(typeof(leavework))]
        public IHttpActionResult Postleavework(leavework leavework)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.leaveworks.Add(leavework);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = leavework.Leave_Id }, leavework);
        }

        // DELETE: api/leaveworks1/5
        [ResponseType(typeof(leavework))]
        public IHttpActionResult Deleteleavework(int id)
        {
            leavework leavework = db.leaveworks.Find(id);
            if (leavework == null)
            {
                return NotFound();
            }

            db.leaveworks.Remove(leavework);
            db.SaveChanges();

            return Ok(leavework);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool leaveworkExists(int id)
        {
            return db.leaveworks.Count(e => e.Leave_Id == id) > 0;
        }
    }
}