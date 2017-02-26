using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public  class DA_ExternalUser
    {
        #region ExternalUserInfoAndLogin

        public static List<ExternalUserInfo> GetExternalUsersInfo()
        {
            using (var smsDB = new SMSEntities())
            {
                var extenalUsersInfo = from externalUserInfo in smsDB.ExternalUserInfoes
                                       select externalUserInfo;
                return extenalUsersInfo.ToList();
            }
        }
        public static UserGroup GetExternalUserGroup(int  externalUserLogInID)
        {
            using (var smsDB = new SMSEntities())
            {
                var tmp = smsDB.ExternalUserLogin_UserGroup_Mapping.FirstOrDefault(m => m.ExternalUserLoginID == externalUserLogInID);
                if(tmp != null)
                {
                    return tmp.UserGroup;
                }

            }
            return null;
        }
        public static List<ExternalUserInfo> GetExternalUsersInfoBySchoolId(int schoolId)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.ExternalUserInfoes.Where(m => m.SchoolID == schoolId).ToList();
            }
        }

        public static ExternalUserInfo GetExternalUserInfo(int? externalUserInfoId)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.ExternalUserInfoes.Find(externalUserInfoId);
            }
        }

        public static bool CheckExternalUserGroupTypeIsAdmin(int? externalUserInfoId)
        {
            bool result = false;
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin externalUserLogin = smsDB.ExternalUserLogins.SingleOrDefault(m => m.ExternalUserInfoID == externalUserInfoId);

                ExternalUserLogin_UserGroup_Mapping userMapping = smsDB.ExternalUserLogin_UserGroup_Mapping.SingleOrDefault(m => m.ExternalUserLoginID == externalUserLogin.ExternalUserLoginID && m.UserGroupId == 1);

                if (userMapping != null)
                {
                    result = true;
                }
            }
            return result;
        }

        public static int AddExternalUserInfo(ExternalUserInfo userToInsert)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.ExternalUserInfoes.Add(userToInsert);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteExternalUserInfo(int? externalUserInfoId)
        {
            using (var smsDB = new SMSEntities())
            {
                ExternalUserInfo externalUserInfo = smsDB.ExternalUserInfoes.Find(externalUserInfoId);

                if (externalUserInfo != null)
                {
                    smsDB.ExternalUserInfoes.Remove(externalUserInfo);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditExternalUserInfo(ExternalUserInfo userToEdit)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                ExternalUserInfo externalUser = smsDB.ExternalUserInfoes.Find(userToEdit.ExternalUserInfoID);
                externalUser.FirstName = userToEdit.FirstName;
                externalUser.LastName = userToEdit.LastName;
                externalUser.MiddleName = userToEdit.MiddleName;
                externalUser.Pin = userToEdit.Pin;
                externalUser.School = userToEdit.School;
                externalUser.SchoolID = userToEdit.SchoolID;
                externalUser.Address1 = userToEdit.Address1;
                externalUser.Address2 = userToEdit.Address2;
                externalUser.City = userToEdit.City;
                externalUser.Country = userToEdit.Country;
                externalUser.CreateDate = userToEdit.CreateDate;
                externalUser.EmailID = userToEdit.EmailID;
                externalUser.State = userToEdit.State;

                return smsDB.SaveChanges();
            }

        }



        public static List<ExternalUserLogin> GetExternalUsersLogin()
        {
            using (var smsDB = new SMSEntities())
            {
                var extenalUserLogins = from externalUserLogin in smsDB.ExternalUserLogins
                                        select externalUserLogin;
                return extenalUserLogins.ToList();
            }
        }

        public static ExternalUserLogin GetExternalUserLogin(int? externalUserLoginId)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.ExternalUserLogins.Find(externalUserLoginId);
            }
        }

        public static int AddExternalUserLogin(ExternalUserLogin userToInsert)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.ExternalUserLogins.Add(userToInsert);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteExternalUserLogin(int? externalUserLoginId)
        {
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin externalUserLogin = smsDB.ExternalUserLogins.Find(externalUserLoginId);

                if (externalUserLogin != null)
                {
                    smsDB.ExternalUserLogins.Remove(externalUserLogin);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditExternalUserLogin(ExternalUserLogin userToEdit)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin externalUserLogin = smsDB.ExternalUserLogins.Find(userToEdit.ExternalUserLoginID);
                externalUserLogin.CreateDate = userToEdit.CreateDate;
                externalUserLogin.CurrentSuccesfulLogin = userToEdit.CurrentSuccesfulLogin;
                externalUserLogin.Disabled = userToEdit.Disabled;
                externalUserLogin.ExternalUserInfoID = userToEdit.ExternalUserInfoID;
                externalUserLogin.ExternalUserName = userToEdit.ExternalUserName;
                externalUserLogin.FailedLoginCount = userToEdit.FailedLoginCount;
                externalUserLogin.LastSuccesfulLogin = userToEdit.LastSuccesfulLogin;
                externalUserLogin.Password = userToEdit.Password;

                return smsDB.SaveChanges();
            }

        }



        public static int DeleteExternalUserAndUserGroupMapping(int? mappingIdToRemove)
        {
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin_UserGroup_Mapping userMapping = smsDB.ExternalUserLogin_UserGroup_Mapping.Find(mappingIdToRemove);

                if (userMapping != null)
                {
                    smsDB.ExternalUserLogin_UserGroup_Mapping.Remove(userMapping);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditExternalUserAndUserGroupMapping(ExternalUserLogin_UserGroup_Mapping mappingToEdit)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                ExternalUserLogin_UserGroup_Mapping userMapping = smsDB.ExternalUserLogin_UserGroup_Mapping.Find(mappingToEdit.ExternalUserLogin_UserGroup_ID);
                userMapping.ExternalUserLoginID = mappingToEdit.ExternalUserLoginID;
                userMapping.UserGroupId = mappingToEdit.UserGroupId;
                return smsDB.SaveChanges();
            }
        }

        public static int AddExternalUserAndUserGroupMapping(ExternalUserLogin_UserGroup_Mapping mappingToAdd)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.ExternalUserLogin_UserGroup_Mapping.Add(mappingToAdd);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }
        #endregion
    }
}
