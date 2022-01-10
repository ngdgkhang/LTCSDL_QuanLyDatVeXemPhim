using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.DAO;

namespace QuanLyDatVeXemPhim.BUS
{
    class BUS_Phim
    {
        DAO_Phim dAO_Phim;

        public BUS_Phim()
        {
            dAO_Phim = new DAO_Phim();
        }

        public void ListPhim(DataGridView dg)
        {
            //XỬ lý lỗi
            dg.DataSource = dAO_Phim.ListPhim();
        }
        public bool AddPhim(Movy m)
        {
            bool result = false;
            dAO_Phim.addPhim(m);
            result = true;
            return result;
        }
        public bool DeletePhim(int id)
        {
            bool result = false;
            dAO_Phim.deletePhim(id);
            result = true;
            return result;
        }
        public bool UpdatePhim(Movy m)
        {
            dAO_Phim.updatePhim(m);
            return true;
        }
    }
}
