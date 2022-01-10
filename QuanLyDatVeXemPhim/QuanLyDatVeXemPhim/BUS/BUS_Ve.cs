using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_Ve
    {
        DAO_Ve dAO_Ve;

        public BUS_Ve()
        {
            dAO_Ve = new DAO_Ve();
        }

        public void ListVe(DataGridView dg)
        {
            dg.DataSource = dAO_Ve.ListVe();
        }

        public bool DeleteVe(int id)
        {
            dAO_Ve.deleteVe(id);
            return true;
        }

        public void ListKhachhang(ComboBox cb)
        {
            //XỬ lý lỗi
            cb.DataSource = dAO_Ve.ListKhachhang();
            cb.DisplayMember = "MemberName";
            cb.ValueMember = "idMember";
        }

        public void ListPhim(ComboBox cb)
        {
            //XỬ lý lỗi
            cb.DataSource = dAO_Ve.ListPhim();
            cb.DisplayMember = "MovieName";
            cb.ValueMember = "MovieID";
        }

        public void ListXuatchieu(ComboBox cb, int id)
        {
            //XỬ lý lỗi
            cb.DataSource = dAO_Ve.ListXuatchieu(id);
            cb.DisplayMember = "Showtime1";
            cb.ValueMember = "Showtime1";
        }

        public Showtime Thoigian(int idPhim,int xuatchieu )
        {
            Showtime xc = dAO_Ve.Thoigian(idPhim, xuatchieu);
            return xc;
        }

       public string Choconguoi(int idPhim, string xuatchieu)
        {
            string chongoi =  null;
            if (dAO_Ve.Choconguoi(idPhim, xuatchieu) != null)
                chongoi = dAO_Ve.Choconguoi(idPhim, xuatchieu);
            else return null;
            return chongoi;
        }

        public bool AddVe(Booking book)
        {
            bool result = false;
            dAO_Ve.addVe(book);
            result = true;
            return result;
        }

    }
}
