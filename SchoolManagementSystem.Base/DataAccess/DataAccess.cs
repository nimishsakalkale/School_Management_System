using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DataAccess
    {
        internal static List<Religion> GetReligion()
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.Religions.ToList();
            }
        }

        internal static List<Gender> GetGenders()
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.Genders.ToList();
            }
        }

        internal static List<Nationality> GetNationality()
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.Nationalities.ToList();
            }
        }

        internal static List<Category> GetCategory()
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.Categories.ToList();
            }
        }

        internal static bool IsValidAdminUser(AdminLogin modelToVerify)
        {
            bool result = false;
            try
            {
                using (var smsDB = new SMSEntities())
                {
                    School school = smsDB.Schools.SingleOrDefault(m => m.SchoolID == modelToVerify.SchoolId);

                    if (school != null)
                    {
                        ExternalUserLogin externalUserLogin = smsDB.ExternalUserLogins.SingleOrDefault(m => m.ExternalUserName == modelToVerify.Username && m.Password == modelToVerify.Password);

                        if (externalUserLogin != null)
                        {
                            if (DA_ExternalUser.CheckExternalUserGroupTypeIsAdmin(externalUserLogin.ExternalUserInfoID))
                            {
                                result = true;
                            }
                        }
                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return result;
        }
    }
}
