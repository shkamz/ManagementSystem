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
    public class worksController : ApiController
    {
        private WorkEntities db = new WorkEntities();

        // GET: api/works
        public IQueryable<work> Getworks()
        {
            return db.works;
        }

        // GET: api/works/5
        [ResponseType(typeof(work))]
        public IHttpActionResult Getwork(int id)
        {
            work work = db.works.Find(id);
            if (work == null)
            {
                return NotFound();
            }

            return Ok(work);
        }

        // PUT: api/works/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putwork(int id, work work)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != work.TaskID)
            {
                return BadRequest();
            }

            db.Entry(work).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!workExists(id))
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

        // POST: api/works
        [ResponseType(typeof(work))]
        public IHttpActionResult Postwork(work work)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.works.Add(work);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = work.TaskID }, work);
        }

        // DELETE: api/works/5
        [ResponseType(typeof(work))]
        public IHttpActionResult Deletework(int id)
        {
            work work = db.works.Find(id);
            if (work == null)
            {
                return NotFound();
            }

            db.works.Remove(work);
            db.SaveChanges();

            return Ok(work);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool workExists(int id)
        {
            return db.works.Count(e => e.TaskID == id) > 0;
        }
    }
}