using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_Student
    {
        #region Student

        public static List<StudentInfo> GetStudentsInfoBySchoolId(int schoolId)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.StudentInfoes.Where(m => m.SchoolID == schoolId).ToList();
            }
        }

        public static StudentInfo GetStudentInfo(int studentId)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.StudentInfoes.SingleOrDefault(m => m.StudentId == studentId);
            }
        }

        public static StudentInfo GetStudentInfoByLoginID(int loginID)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                return smsDB.StudentInfoes.SingleOrDefault(m => m.ExternalUserLoginID == loginID);
            }
        }

        public static int AddStudentInfo(StudentInfo studentInfo)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.StudentInfoes.Add(studentInfo);

                //smsDB.StudentContacts.Add(studentInfo.StudentContacts.ToList()[0]);

                //smsDB.StudentHistories.Add(studentInfo.StudentHistories.ToList()[0]);

                //smsDB.StudentParentInfoes.Add(studentInfo.StudentParentInfoes.ToList()[0]);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int AddStudentContact(StudentContact studentContact)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.StudentContacts.Add(studentContact);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int AddStudentHistory(StudentHistory studentHistory)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.StudentHistories.Add(studentHistory);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        public static int AddStudentParentInfo(StudentParentInfo studentParentInfo)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                //Add Student object into Students DBset
                smsDB.StudentParentInfoes.Add(studentParentInfo);

                // call SaveChanges method to save student into database
                return smsDB.SaveChanges();
            }
        }

        #endregion
    }
}
