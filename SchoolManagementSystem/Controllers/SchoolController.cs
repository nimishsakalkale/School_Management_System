using SchoolManagementSystem.Base;
using SchoolManagementSystem.Base.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace SchoolManagementSystem.Controllers
{
    public class SchoolController : Controller
    {

        public ActionResult Index()
        {
            List<School> schools = DA_School.GetSchools();
            return View(schools);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            School school = DA_School.GetSchool(id);
            if (school == null)
            {
                return HttpNotFound();
            }
            return View(school);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Exclude = "[SchoolID]")] School school)
        {
            if (ModelState.IsValid)
            {
                DA_School.EditSchool(school);
                return RedirectToAction("Index");
            }
            return View(school);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Exclude = "[SchoolID]")] School schoolToInsert)
        {
            if (ModelState.IsValid)
            {
                DA_School.AddSchool(schoolToInsert);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        // GET: Course/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            School school = DA_School.GetSchool(id);
            if (school == null)
            {
                return HttpNotFound();
            }
            return View(school);
        }

        public ActionResult Delete()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            if (ModelState.IsValid)
            {
                try
                {
                     DA_School.DeleteSchool(id);
                }
                catch (Exception)
                {
                    //Log the error (uncomment dex variable name and add a line here to write a log.
                    return RedirectToAction("Delete", new { id = id, saveChangesError = true });
                }
                return RedirectToAction("Index");
            }
            return View();
        }

    }
}