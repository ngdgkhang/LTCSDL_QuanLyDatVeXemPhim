using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLyDatVeXemPhim.BUS;

namespace QuanLyDatVeXemPhim
{
    public partial class FDangKy : Form
    {
        BUS_DangKy bDangKy;
        public FDangKy()
        {
            bDangKy = new BUS_DangKy();
            InitializeComponent();
        }

        private void FDangKy_Load(object sender, EventArgs e)
        {
            txtpass.UseSystemPasswordChar = true;
            txtconfirm.UseSystemPasswordChar = true;
        }

        private void SignUpbtn_Click(object sender, EventArgs e)
        {
            if (txtusername.Text == "")
            {
                MessageBox.Show("UserName Không Được Rỗng!!");
                return;
            }
            else if(txtemail.Text == "")
            {
                MessageBox.Show("Email Không Được Rỗng!!");
                return;
            }
            else if(IsValidEmail(txtemail.Text) == false)
            {
                MessageBox.Show("Định Dạng Email Sai!!");
                return;
            }
            else if (txtname.Text == "")
            {
                MessageBox.Show("Your Name Không Được Rỗng!!");
                return;
            }
            else if (txtpass.Text == "" || txtconfirm.Text == "")
            {
                MessageBox.Show("Password Không Được Rỗng!!");
                return;
            }
            else if (txtpass.Text != txtconfirm.Text)
            {
                MessageBox.Show("Mật Khẩu Không Giống Nhau");
                return;
            }
            Employee em = new Employee();
            em.Username = txtusername.Text;
            em.Email = txtemail.Text;
            em.EmployeeName = txtname.Text;
            em.Password = Hash_SHA1( txtconfirm.Text);
            if (bDangKy.CheckUser(txtusername.Text) == true)
            {
                MessageBox.Show("User Name Đã Bị Trùng");
                return;
            }
            if (bDangKy.addMember(em))
            {
                MessageBox.Show("Thêm Thành Viên Thành Công");
            }
            else
            {
                MessageBox.Show("Thêm Thành Viên Thất Bại!");
            }
        }

        private void backbtn_Click(object sender, EventArgs e)
        {
            this.Close();
            FDangNhap f = new FDangNhap();
            f.Show();
        }
        public bool IsValidEmail(string email)
        {
            var trimmedEmail = email.Trim();

            if (trimmedEmail.EndsWith("."))
            {
                return false;
            }
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == trimmedEmail;
            }
            catch
            {
                return false;
            }
        }
        public string Hash_SHA1(string input)
        {
            using (SHA1Managed sha1 = new SHA1Managed())
            {
                var hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(input));
                var sb = new StringBuilder(hash.Length * 2);

                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("X2"));
                }

                return sb.ToString();
            }
        }

        private void showpassbtn_CheckedChanged(object sender, EventArgs e)
        {
            if (showpassbtn.Checked == true)
            {
                txtpass.UseSystemPasswordChar = false;
                txtconfirm.UseSystemPasswordChar = false;
            }
            else
            {
                txtpass.UseSystemPasswordChar = true;
                txtconfirm.UseSystemPasswordChar = true;
            }
        }

        private void txtusername_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
