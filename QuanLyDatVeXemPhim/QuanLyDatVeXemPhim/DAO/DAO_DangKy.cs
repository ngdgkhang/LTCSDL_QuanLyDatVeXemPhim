using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_DangKy
    {
        moviedbEntities db;
        public DAO_DangKy()
        {
            db = new moviedbEntities();
        }

        public void addMember(Employee e)
        {
            db.Employees.Add(e);
            db.SaveChanges();
        }

        public Employee getUser(string UserName)
        {
            Employee e = db.Employees.FirstOrDefault(s => s.Username == UserName);
            return e;
        }
    }
}
