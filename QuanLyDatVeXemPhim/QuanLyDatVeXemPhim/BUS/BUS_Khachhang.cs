using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_Khachhang
    {
        DAO_Khachhang dAO_Khachhang;
        public BUS_Khachhang()
        {
            dAO_Khachhang = new DAO_Khachhang();
        }

        public void ListKhachhang(DataGridView dg)
        {
            dg.DataSource = dAO_Khachhang.ListKhachhang();
        }
        public dynamic ListReportKH()
        {
            return dAO_Khachhang.ListReportKH();
        }

        public bool AddKhachhang(Member m)
        {
            bool kq = false;
            try
            {
                dAO_Khachhang.addKhachhang(m);
                kq = true;
            }
            catch 
            {
                
            }
            return true;
        }    

        public bool DeleteKhachhang(int id)
        {
            bool kq = false;
            try
            {
                dAO_Khachhang.deleteKhachhang(id);
                kq = true;
            }
            catch 
            {

            }
            return true;
        }
        public bool UpdateKhachhang(Member m)
        {

            bool kq = false;
            try
            {
                dAO_Khachhang.updateKhachhang(m);
                kq = true;
            }
            catch
            {

            }
            return true;
        }
    }
}
