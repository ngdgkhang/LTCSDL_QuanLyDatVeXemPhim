using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_Khachhang
    {
        moviedbEntities db;

        public DAO_Khachhang()
        {
            db = new moviedbEntities();
        }

        public dynamic ListKhachhang()
        {
            dynamic ds = db.Members.Select(s => new
            {
               s.idMember,
               s.MemberName,
               s.Phone,
               s.Email,
               s.Address,
               s.BirthDate,
               s.Gender
            }).ToList();
            return ds;
        }

        public dynamic ListReportKH()
        {
            var ds = db.sp_thongKeKH().ToList();
            return ds;

        }

        public void addKhachhang(Member m)
        {
            db.Members.Add(m);
            db.SaveChanges();
        }

        public void deleteKhachhang(int id)
        {
            Member m = db.Members.Find(id);
            db.Members.Remove(m);
            db.SaveChanges();
        }

        public void updateKhachhang(Member m)
        {
            Member mem = db.Members.Find(m.idMember);
            mem.MemberName = m.MemberName;
            mem.Address = m.Address;
            mem.BirthDate = m.BirthDate;
            mem.Phone = m.Phone;
            mem.Gender = m.Gender;
            mem.Email = m.Email;
            db.SaveChanges();
        }
    }
}
