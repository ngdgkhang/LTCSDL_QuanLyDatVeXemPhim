using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_DangNhap
    {
        DAO_DangNhap dDangNhap;
        public BUS_DangNhap() {
           dDangNhap = new DAO_DangNhap();
        }

        public bool CheckUser(String name, String Pass)
        {
            bool flag = false;
            if(dDangNhap.getUser(name, Pass)!=null)flag = true;
            return flag;
        }
    }
}
