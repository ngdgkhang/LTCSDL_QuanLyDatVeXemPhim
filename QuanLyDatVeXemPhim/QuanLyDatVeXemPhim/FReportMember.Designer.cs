
namespace QuanLyDatVeXemPhim
{
    partial class FReportMember
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
            this.cRViewerMember = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.CRMember1 = new QuanLyDatVeXemPhim.Reports.CRMember();
            this.SuspendLayout();
            // 
            // cRViewerMember
            // 
            this.cRViewerMember.ActiveViewIndex = 0;
            this.cRViewerMember.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.cRViewerMember.Cursor = System.Windows.Forms.Cursors.Default;
            this.cRViewerMember.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cRViewerMember.Location = new System.Drawing.Point(0, 0);
            this.cRViewerMember.Name = "cRViewerMember";
            this.cRViewerMember.ReportSource = this.CRMember1;
            this.cRViewerMember.Size = new System.Drawing.Size(800, 450);
            this.cRViewerMember.TabIndex = 0;
            // 
            // FReportMember
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.cRViewerMember);
            this.Name = "FReportMember";
            this.Text = "ReportMember";
            this.ResumeLayout(false);

        }

        #endregion

        public CrystalDecisions.Windows.Forms.CrystalReportViewer cRViewerMember;
        private Reports.CRMember CRMember1;
    }
}