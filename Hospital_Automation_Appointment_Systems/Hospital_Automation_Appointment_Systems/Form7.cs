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
    public partial class Form7 : Form
    {
        public Form7()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class

        public int doktorNo;
        private void Form7_Load(object sender, EventArgs e)
        {
            label2.Text =doktorNo.ToString();
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;  
            komut.CommandText = "DoctorRandevuShow";
            komut.Parameters.AddWithValue("DoktorNo", Convert.ToInt32(label2.Text));
            SqlDataAdapter goruntule = new SqlDataAdapter(komut);
            DataTable dt = new DataTable(); 
            goruntule.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form6 form6=new Form6();
            form6.Show();
            this.Hide();
        }
    }
}
