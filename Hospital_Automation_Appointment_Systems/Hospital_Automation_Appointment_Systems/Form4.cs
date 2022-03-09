using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Hospital_Automation_Appointment_Systems
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        private void button1_Click(object sender, EventArgs e)
        {
            Form11 form11 = new Form11();
            form11.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form9 form9=new Form9();
            form9.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form8 form8=new Form8();
            form8.Show();
            this.Hide();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }
    }
}
