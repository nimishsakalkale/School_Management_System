using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_School
    {
        #region School
        public static List<School> GetSchools()
        {
            using (var smsDB = new SMSEntities())
            {
                var schools = from school in smsDB.Schools
                              select school;
                return schools.ToList();
            }
        }

        public static School GetSchool(int? SchoolId)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.Schools.Find(SchoolId);
            }
        }

        public static int AddSchoolWithDefaultUser(School schoolToInsert)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.Schools.Add(schoolToInsert);

                //School school = new GetSchool 
                // Get Admin User
                //UserGroup userGroup = GetUserGroup(1);

                // ExternalUserInfo
                ExternalUserInfo externalUserToAdd = new ExternalUserInfo();
                externalUserToAdd.SchoolID = schoolToInsert.SchoolID;
                externalUserToAdd.FirstName = "Admin";
                externalUserToAdd.LastName = "Admin";
                int result = DA_ExternalUser.AddExternalUserInfo(externalUserToAdd);

                ExternalUserLogin externalUserLogin = new ExternalUserLogin();
                //externalUserLogin.
                // ExternalUserLogin

                // ExternalUserLogin_UserGroup_Mapping

                // 
                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int AddSchool(School schoolToInsert)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                schoolToInsert.CreateDate = DateTime.Now;
                schoolToInsert.IsActive = true;
                smsDB.Schools.Add(schoolToInsert);

                // call SaveChanges method to save student into database
                smsDB.SaveChanges();

                // Add Default Admin User into database when school is added.
                ExternalUserInfo externalUserInfo = new ExternalUserInfo();
                externalUserInfo.SchoolID = schoolToInsert.SchoolID;
                externalUserInfo.EmailID = "Admin@" + externalUserInfo.SchoolID + ".com";

                smsDB.ExternalUserInfoes.Add(externalUserInfo);
                smsDB.SaveChanges();

                ExternalUserLogin externalUserLogin = new ExternalUserLogin();
                externalUserLogin.ExternalUserInfoID = externalUserInfo.ExternalUserInfoID;
                externalUserLogin.ExternalUserName = "Admin" + schoolToInsert.SchoolID;
                externalUserLogin.Password = "andtech123#";

                smsDB.ExternalUserLogins.Add(externalUserLogin);
                smsDB.SaveChanges();

                ExternalUserLogin_UserGroup_Mapping userMapping = new ExternalUserLogin_UserGroup_Mapping();
                userMapping.ExternalUserLoginID = externalUserLogin.ExternalUserLoginID;
                userMapping.UserGroupId = 1;

                smsDB.ExternalUserLogin_UserGroup_Mapping.Add(userMapping);
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteSchool(int? SchoolId)
        {
            using (var smsDB = new SMSEntities())
            {
                School school = smsDB.Schools.Find(SchoolId);

                if (school != null)
                {
                    smsDB.Schools.Remove(school);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditSchool(School schoolToEdit)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                School school = smsDB.Schools.Find(schoolToEdit.SchoolID);
                school.SchoolName = schoolToEdit.SchoolName;
                school.IsActive = schoolToEdit.IsActive;
                //school.ExternalUsers = schoolToEdit.ExternalUsers;
                school.EmailID = schoolToEdit.EmailID;
                school.Description = schoolToEdit.Description;
                school.Country = schoolToEdit.Country;
                school.Address1 = schoolToEdit.Address1;
                school.Address2 = schoolToEdit.Address2;
                school.City = schoolToEdit.City;
                school.Pin = schoolToEdit.Pin;
                school.State = schoolToEdit.State;
                // school.School_ExternalUserXREF = schoolToEdit.School_ExternalUserXREF;
                return smsDB.SaveChanges();
            }

        }



        #endregion
    }
}
