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
    public class employeesController : ApiController
    {
        private db_a2ec4e_EmpModel db = new db_a2ec4e_EmpModel();

        // GET: api/employees
        public IQueryable<employee> Getemployees()
        {
            return db.employees;
        }

        // GET: api/employees/5
        [ResponseType(typeof(employee))]
        public IHttpActionResult Getemployee(int id)
        {
            employee employee = db.employees.Find(id);
            if (employee == null)
            {
                return NotFound();
            }

            return Ok(employee);
        }

        // PUT: api/employees/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putemployee(int id, employee employee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != employee.Emp_ID)
            {
                return BadRequest();
            }

            db.Entry(employee).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!employeeExists(id))
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

        // POST: api/employees
        [ResponseType(typeof(employee))]
        public IHttpActionResult Postemployee(employee employee)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.employees.Add(employee);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = employee.Emp_ID }, employee);
        }

        // DELETE: api/employees/5
        [ResponseType(typeof(employee))]
        public IHttpActionResult Deleteemployee(int id)
        {
            employee employee = db.employees.Find(id);
            if (employee == null)
            {
                return NotFound();
            }

            db.employees.Remove(employee);
            db.SaveChanges();

            return Ok(employee);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool employeeExists(int id)
        {
            return db.employees.Count(e => e.Emp_ID == id) > 0;
        }

        [HttpGet]
        [Route("api/employees/username={username}/password={password}")]
        public async Task<IHttpActionResult> UserDetailsLogin(string username, string password)
        {
            employee login =
                         await db.employees.Where(x => x.Emp_name == username && x.Password == password).SingleOrDefaultAsync();
            if (login == null)
            {
                return NotFound();
            }
            return Ok(login);
        }

        //this is to search by name.eg.api/employees1/GetName/steve
        [HttpGet]
        [Route("api/employees/GetName/{username}")]
        public async Task<IHttpActionResult> GetName(string username)
        {

            employee employee = await db.employees.Where(x => x.Emp_name == username).SingleOrDefaultAsync();

            if (employee == null)
            {
                return NotFound();
            }

            return Ok(employee);
        }
    }
}