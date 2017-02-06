using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolManagementSystem.Base.DataAccess
{
    public class DA_SchoolStream
    {
        #region School Streams

        public static int InsertSchoolStream(SchoolStream stream)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                smsDB.SchoolStreams.Add(stream);
                return smsDB.SaveChanges();
            }
        }

        public static int DeleteSchoolStream(SchoolStream stream)
        {
            using (var smsDB = new SMSEntities())
            {
                SchoolStream schoolStream = smsDB.SchoolStreams.Find(stream);

                if (schoolStream != null)
                {
                    smsDB.SchoolStreams.Remove(schoolStream);
                    return smsDB.SaveChanges();
                }
                else
                {
                    return 0; // no record found
                }
            }
        }

        public static int EditSchoolStream(SchoolStream stream)
        {
            //create DBContext object
            using (var smsDB = new SMSEntities())
            {
                SchoolStream schoolStream = smsDB.SchoolStreams.Find(stream.SchoolStreamID);
                schoolStream.SchoolID = stream.SchoolID;
                schoolStream.StreamID = stream.StreamID;
                return smsDB.SaveChanges();
            }
        }


        #endregion
    }
}
