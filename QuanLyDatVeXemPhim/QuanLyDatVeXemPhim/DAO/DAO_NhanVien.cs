using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_NhanVien
    {
        moviedbEntities db;

        public DAO_NhanVien()
        {
            db = new moviedbEntities();
        }

        public dynamic ListNhanVien()
        {
            dynamic ds = db.Employees.Select(s => new
            {
                s.idEmployee,
                s.EmployeeName,
                s.Phone,
                s.Email,
                s.Address,
                s.BirthDate,
                s.Gender
            }).ToList();
            return ds;
        }

        public void addNhanvien(Employee m)
        {
            db.Employees.Add(m);
            db.SaveChanges();
        }

        public void deleteNhanvien(int id)
        {
            Employee m = db.Employees.Find(id);
            db.Employees.Remove(m);
            db.SaveChanges();
        }

        public void updateNhanvien(Employee m)
        {
            Employee mem = db.Employees.Find(m.idEmployee);
            mem.EmployeeName = m.EmployeeName;
            mem.Address = m.Address;
            mem.BirthDate = m.BirthDate;
            mem.Phone = m.Phone;
            mem.Gender = m.Gender;
            mem.Email = m.Email;
            db.SaveChanges();
        }
    }
}
