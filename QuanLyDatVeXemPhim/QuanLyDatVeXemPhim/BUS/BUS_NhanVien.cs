using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_NhanVien
    {
        DAO_NhanVien dNhanVien;
        public BUS_NhanVien()
        {
            dNhanVien = new DAO_NhanVien();
        }

        public void ListNhanVien(DataGridView dg)
        {
            dg.DataSource = dNhanVien.ListNhanVien();
        }

        public bool AddNhanvien(Employee m)
        {
            bool kq = false;
            try
            {
                dNhanVien.addNhanvien(m);
                kq = true;
            }
            catch
            {

            }
            return true;
        }

        public bool DeleteNhanvien(int id)
        {
            bool kq = false;
            try
            {
                dNhanVien.deleteNhanvien(id);
                kq = true;
            }
            catch
            {

            }
            return true;
        }
        public bool UpdateNhanvien(Employee m)
        {

            bool kq = false;
            try
            {
                dNhanVien.updateNhanvien(m);
                kq = true;
            }
            catch
            {

            }
            return true;
        }
    }
}
