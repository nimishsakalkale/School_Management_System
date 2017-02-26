//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolManagementSystem.Base
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StudentInfo()
        {
            this.StudentAcademicDetails = new HashSet<StudentAcademicDetail>();
            this.StudentContacts = new HashSet<StudentContact>();
            this.StudentFeesDetails = new HashSet<StudentFeesDetail>();
            this.StudentHistories = new HashSet<StudentHistory>();
            this.StudentParentInfoes = new HashSet<StudentParentInfo>();
        }
    
        public int StudentId { get; set; }
        public int SchoolID { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Nationality { get; set; }
        public string BirthPlace { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public string Gender { get; set; }
        public string BloodGroup { get; set; }
        public string IdentityNumber { get; set; }
        public string Religion { get; set; }
        public string Category { get; set; }
        public byte[] Photo { get; set; }
        public string MotherTongue { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public Nullable<System.DateTime> DeletedDate { get; set; }
        public Nullable<int> ExternalUserLoginID { get; set; }
    
        public virtual ExternalUserLogin ExternalUserLogin { get; set; }
        public virtual School School { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentAcademicDetail> StudentAcademicDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentContact> StudentContacts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentFeesDetail> StudentFeesDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentHistory> StudentHistories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentParentInfo> StudentParentInfoes { get; set; }
    }
}
