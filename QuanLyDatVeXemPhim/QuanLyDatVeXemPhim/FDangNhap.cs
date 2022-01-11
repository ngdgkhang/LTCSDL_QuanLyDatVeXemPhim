using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.BUS;

namespace QuanLyDatVeXemPhim
{
    public partial class FDangNhap : Form
    {
        BUS_DangNhap bDangNhap;
        FDangKy f;
        public FDangNhap()
        {
            bDangNhap = new BUS_DangNhap();
            InitializeComponent();
        }

        private void FDangNhap_Load(object sender, EventArgs e)
        {
            passtxt.UseSystemPasswordChar = true;
        }

        
        private void Loginbtn_Click(object sender, EventArgs e)
        {
            if (usernametxt.Text == "") {
                MessageBox.Show("Username Can't Empty !!");
            }
            else if (passtxt.Text == "")
            {
                MessageBox.Show("Password Can't Empty !!");
            }
            else
            {
                f = new FDangKy();
                String hashpass = f.Hash_SHA1(passtxt.Text);
                if(bDangNhap.CheckUser(usernametxt.Text, hashpass) == true)
                {
                    MessageBox.Show("Login ok!");
                    FDashBoard menu = new FDashBoard();
                    this.Hide();
                    menu.Show();
                }
                else
                {
                    MessageBox.Show("Invalid user");
                }
            }
        }

        private void SignUpbtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            f = new FDangKy();
            f.Show();
        }

        private void exitbtn_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void hidebtn_Click(object sender, EventArgs e)
        {
            passtxt.UseSystemPasswordChar = false;
            showbtn.BringToFront();
        }

        private void showbtn_Click(object sender, EventArgs e)
        {
            passtxt.UseSystemPasswordChar = true;
            hidebtn.BringToFront();
        }
    }
}
