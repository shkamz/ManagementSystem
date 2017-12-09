using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TESTMVC.Models;

namespace TESTMVC.Controllers
{
    public class leaveworksController : Controller
    {
        private LeaveEntities db = new LeaveEntities();

        // GET: leaveworks
        public ActionResult Index()
        {
            return View(db.leaveworks.ToList());
        }

        // GET: leaveworks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            leavework leavework = db.leaveworks.Find(id);
            if (leavework == null)
            {
                return HttpNotFound();
            }
            return View(leavework);
        }

        // GET: leaveworks/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: leaveworks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Leave_Id,Leave_Status,Leave_Date,Leave_EndDate,Leave_Desc,Emp_name,Leave_Type")] leavework leavework)
        {
            if (ModelState.IsValid)
            {
                db.leaveworks.Add(leavework);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(leavework);
        }

        // GET: leaveworks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            leavework leavework = db.leaveworks.Find(id);
            if (leavework == null)
            {
                return HttpNotFound();
            }
            return View(leavework);
        }

        // POST: leaveworks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Leave_Id,Leave_Status,Leave_Date,Leave_EndDate,Leave_Desc,Emp_name,Leave_Type")] leavework leavework)
        {
            if (ModelState.IsValid)
            {
                db.Entry(leavework).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(leavework);
        }

        // GET: leaveworks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            leavework leavework = db.leaveworks.Find(id);
            if (leavework == null)
            {
                return HttpNotFound();
            }
            return View(leavework);
        }

        // POST: leaveworks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            leavework leavework = db.leaveworks.Find(id);
            db.leaveworks.Remove(leavework);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
