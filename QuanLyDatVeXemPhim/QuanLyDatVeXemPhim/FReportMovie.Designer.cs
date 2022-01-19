
namespace QuanLyDatVeXemPhim
{
    partial class FReportMovie
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FReportMovie));
            this.CRMovie1 = new QuanLyDatVeXemPhim.Reports.CRMovie();
            this.cRViewMovie = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.CRMember1 = new QuanLyDatVeXemPhim.Reports.CRMember();
            this.SuspendLayout();
            // 
            // cRViewMovie
            // 
            this.cRViewMovie.ActiveViewIndex = 0;
            this.cRViewMovie.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.cRViewMovie.Cursor = System.Windows.Forms.Cursors.Default;
            this.cRViewMovie.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cRViewMovie.Location = new System.Drawing.Point(0, 0);
            this.cRViewMovie.Name = "cRViewMovie";
            this.cRViewMovie.ReportSource = this.CRMember1;
            this.cRViewMovie.Size = new System.Drawing.Size(800, 450);
            this.cRViewMovie.TabIndex = 0;
            // 
            // FReportMovie
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.cRViewMovie);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FReportMovie";
            this.Text = "FReportMovie";
            this.Load += new System.EventHandler(this.FReportMovie_Load);
            this.ResumeLayout(false);

        }

        #endregion

        public CrystalDecisions.Windows.Forms.CrystalReportViewer cRViewMovie;
        private Reports.CRMember CRMember1;
        private Reports.CRMovie CRMovie1;
    }
}