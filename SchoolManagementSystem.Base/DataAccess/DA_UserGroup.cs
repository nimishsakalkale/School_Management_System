using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_UserGroup
    {
        #region UserGroup

        public static List<UserGroup> GetUserGroups()
        {
            using (var smsDB = new SMSEntities())
            {
                var userGroups = from userGroup in smsDB.UserGroups
                                 select userGroup;
                return userGroups.ToList();
            }
        }


        public static UserGroup GetUserGroup(int? groupId)
        {
            using (var smsDB = new SMSEntities())
            {
                return smsDB.UserGroups.Find(groupId);
            }
        }

        public static int AddUserGroup(UserGroup userGroup)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.UserGroups.Add(userGroup);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteUserGroup(int? groupId)
        {
            using (var smsDB = new SMSEntities())
            {
                UserGroup userGroup = smsDB.UserGroups.Find(groupId);

                if (userGroup != null)
                {
                    smsDB.UserGroups.Remove(userGroup);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditUserGroup(UserGroup userGroup)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                UserGroup usergrp = smsDB.UserGroups.Find(userGroup.UserGroupId);
                usergrp.IsExternal = userGroup.IsExternal;
                
                usergrp.UserGroupName = userGroup.UserGroupName;
                return smsDB.SaveChanges();
            }

        }

        #endregion
    }
}
