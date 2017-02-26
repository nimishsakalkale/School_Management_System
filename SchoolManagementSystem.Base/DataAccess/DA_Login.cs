using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_Login
    {
        public static UserGroup  Login(LoginCredentials login)
        {
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin extuser = smsDB.ExternalUserLogins.FirstOrDefault(m => m.ExternalUserName == login.Username);
                if(extuser!= null)
                {
                    var tmp = smsDB.ExternalUserLogin_UserGroup_Mapping.FirstOrDefault(m => m.ExternalUserLoginID == extuser.ExternalUserLoginID);
                    return tmp.UserGroup;
                }
                InternalUser interanlUser = smsDB.InternalUsers.FirstOrDefault(m => m.UserName == login.Username);
                if (interanlUser != null)
                {
                    return interanlUser.UserGroup;
                }


            }
            return null;
        }

        public static ExternalUserLogin GetExternalUser(LoginCredentials login)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.ExternalUserLogins.FirstOrDefault(m => m.ExternalUserName == login.Username);
            }
        }

        public static InternalUser GetInternalUser(LoginCredentials login)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.InternalUsers.FirstOrDefault(m => m.UserName == login.Username);
            }
        }
    }
}
