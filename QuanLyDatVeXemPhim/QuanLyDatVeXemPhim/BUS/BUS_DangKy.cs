using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_DangKy
    {
        DAO_DangKy dDangKy;
        public BUS_DangKy() {
            dDangKy = new DAO_DangKy();
        }

        public bool addMember(Employee e)
        {
            bool flag = false;
            dDangKy.addMember(e);
            flag = true;
            return flag;
        }

        public bool CheckUser(string name)
        {
            bool flag = false;
            if (dDangKy.getUser(name) != null) flag = true;
            return flag;
        }
    }
}
