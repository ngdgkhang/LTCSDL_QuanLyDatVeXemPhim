using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyDatVeXemPhim.DAO
{
    class DAO_DangNhap
    {
        moviedbEntities db;
        public DAO_DangNhap()
        {
            db = new moviedbEntities();
        }
        public Employee getUser(String UserName, String pass) {
            Employee e = db.Employees.FirstOrDefault(s => s.Username == UserName && s.Password == pass);
            return e;
        }
    }
}
