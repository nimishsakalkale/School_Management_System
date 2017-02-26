using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SchoolManagementSystem.Base;
using SchoolManagementSystem.Base.DataAccess;

namespace SchoolManagementSystem.Controllers
{
    public class HomeController : Controller //Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginCredentials login)
        {
            
            /**
                UserGroupId	UserGroupName
                1	Admin
                2	Parent
                3	Student
                4	Teacher
                5	View
    */

            ExternalUserLogin extuser = DA_Login.GetExternalUser(login);
            if (extuser != null)
            {
                if (extuser.Password != login.Password)
                {
                    return View("Index");
                }

                ExternalUserInfo exUserInfo = DA_ExternalUser.GetExternalUserInfo(extuser.ExternalUserInfoID);
                Session["CurrentUser"] = exUserInfo;
                int userGroupID = DA_ExternalUser.GetExternalUserGroup(extuser.ExternalUserLoginID).UserGroupId;
                Session["UserGroupID"] = userGroupID;
                if(userGroupID == 3 ) // student
                {
                    StudentInfo sInfo = DA_Student.GetStudentInfoByLoginID(extuser.ExternalUserLoginID);
                    return View("~/Views/Student/Index.cshtml", sInfo);
                }

                if (userGroupID == 4) // Teacher
                {
                    return View("~/Views/Teacher/Index.cshtml", exUserInfo);
                }


            }
            else
            {
                InternalUser interanlUser = DA_Login.GetInternalUser(login);

                if (interanlUser != null)
                {
                    if (interanlUser.Password != login.Password)
                    {
                        return View("Index");
                    }
                    Session["CurrentUser"] = interanlUser;
                    Session["UserGroupID"] = interanlUser.UserGroupId;
                }
                else
                {
                    return View("Index");
                }
            }




            return View();
        }
    }
}
