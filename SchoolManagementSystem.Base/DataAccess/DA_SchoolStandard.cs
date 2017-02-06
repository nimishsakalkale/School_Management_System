using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_SchoolStandard
    {
        #region School Standards


        public static int InsertSchoolStandard(SchoolStandard standardToInsert)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                smsDB.SchoolStandards.Add(standardToInsert);
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteSchoolStandard(SchoolStandard standardToDelete)
        {
            using (var smsDB = new SMSEntities())
            {
                SchoolStandard standard = smsDB.SchoolStandards.Find(standardToDelete);

                if (standard != null)
                {
                    smsDB.SchoolStandards.Remove(standard);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditSchoolStandard(SchoolStandard standardToEdit)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                SchoolStandard standard = smsDB.SchoolStandards.Find(standardToEdit.SchoolStandardID);
                standard.SchoolID = standardToEdit.SchoolID;
                standard.StandardID = standardToEdit.StandardID;
                return smsDB.SaveChanges();
            }
        }


        #endregion
    }
}
