using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using TESTMVC.Models;

namespace TESTMVC.Controllers
{
    public class announcements1Controller : ApiController
    {
        private AnnouncementEntities db = new AnnouncementEntities();

        // GET: api/announcements1
        public IQueryable<announcement> Getannouncements()
        {
            //return db.announcements;
           return db.announcements.OrderByDescending(x => x.ID);
        }

        // GET: api/announcements1/5
        [ResponseType(typeof(announcement))]
        public IHttpActionResult Getannouncement(int id)
        {
            announcement announcement = db.announcements.Find(id);
            if (announcement == null)
            {
                return NotFound();
            }

            return Ok(announcement);
        }

        // PUT: api/announcements1/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putannouncement(int id, announcement announcement)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != announcement.ID)
            {
                return BadRequest();
            }

            db.Entry(announcement).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!announcementExists(id))
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

        // POST: api/announcements1
        [ResponseType(typeof(announcement))]
        public IHttpActionResult Postannouncement(announcement announcement)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.announcements.Add(announcement);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = announcement.ID }, announcement);
        }

        // DELETE: api/announcements1/5
        [ResponseType(typeof(announcement))]
        public IHttpActionResult Deleteannouncement(int id)
        {
            announcement announcement = db.announcements.Find(id);
            if (announcement == null)
            {
                return NotFound();
            }

            db.announcements.Remove(announcement);
            db.SaveChanges();

            return Ok(announcement);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool announcementExists(int id)
        {
            return db.announcements.Count(e => e.ID == id) > 0;
        }

        //[HttpGet]
        //[Route("api/announcements1/getannouncement")]
        //public async Task<IHttpActionResult> UserDetailsLogin(string username, string password)
        //{
        //    //announcement login = await db.announcements.OrderByDescending(x => x.time).SingleAsync();
        //   // announcement lol = await db.announcements.OrderByDescending(x => x.time);
        //    //return Ok(login);
        //}
    }
}