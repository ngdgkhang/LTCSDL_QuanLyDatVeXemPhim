//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyDatVeXemPhim
{
    using System;
    using System.Collections.Generic;
    
    public partial class Booking
    {
        public int num { get; set; }
        public int idMember { get; set; }
        public int MovieID { get; set; }
        public string MovieName { get; set; }
        public string Showtime { get; set; }
        public string Postition { get; set; }
        public Nullable<int> Theater { get; set; }
        public string Payment { get; set; }
    
        public virtual Member Member { get; set; }
        public virtual Movy Movy { get; set; }
    }
}
