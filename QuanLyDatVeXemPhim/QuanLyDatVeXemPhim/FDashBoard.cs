using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyDatVeXemPhim
{
    public partial class FDashBoard : Form
    {
        public FDashBoard()
        {
            InitializeComponent();
        }

        public void formload(object Form)
        {
            if (this.mainpanel.Controls.Count > 0) this.mainpanel.Controls.RemoveAt(0);
            Form f = Form as Form;
            f.TopLevel = false;
            f.Dock = DockStyle.Fill;
            this.mainpanel.Controls.Add(f);
            this.mainpanel.Tag = f;
            f.Show();
        }

        private void FDashBoard_Load(object sender, EventArgs e)
        {
            formload(new FHome());
        }

        private void btnPhim_Click(object sender, EventArgs e)
        {
            formload(new FQuanlyPhim());
        }

        private void btnNhanvien_Click(object sender, EventArgs e)
        {
            formload(new FQuanLyNhanVien());
        }

        private void btnKhach_Click(object sender, EventArgs e)
        {
            formload(new FQuanlyKhachhang());
        }

        private void ticketbtn_Click(object sender, EventArgs e)
        {
            formload(new FQuanlyVexemphim());
        }

        private void logoutbtn_Click(object sender, EventArgs e)
        {
            this.Close();
            FDangNhap f = new FDangNhap();
            f.Show();
        }

        private void exitbtn_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void homebtn_Click(object sender, EventArgs e)
        {
            formload(new FHome());
        }
    }
}
