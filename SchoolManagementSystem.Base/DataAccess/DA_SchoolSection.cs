using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_SchoolSection
    {
        #region School Sections

        public static int InsertSchoolSection(SchoolSection section)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                smsDB.SchoolSections.Add(section);
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteSchoolSection(SchoolSection section)
        {
            using (var smsDB = new SMSEntities())
            {
                SchoolSection schoolSection = smsDB.SchoolSections.Find(section);

                if (schoolSection != null)
                {
                    smsDB.SchoolSections.Remove(schoolSection);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditSchoolSection(SchoolSection section)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                SchoolSection schoolSection = smsDB.SchoolSections.Find(section.SchoolSectionID);
                schoolSection.SchoolID = section.SchoolID;
                schoolSection.SectionID = section.SectionID;
                return smsDB.SaveChanges();
            }
        }


        #endregion
    }
}
