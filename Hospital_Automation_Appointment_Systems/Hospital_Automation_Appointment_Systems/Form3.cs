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
    public partial class Form3 : Form
    {
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "SifremiUnuttum";  
            baglanti.Open(); 
            if (comboBox1.Text == "Doktor")
            {
                komut.Parameters.AddWithValue("UserTitle", comboBox1.Text);
            }
            else
            {
                komut.Parameters.AddWithValue("UserTitle", comboBox1.Text);
            }
            komut.Parameters.AddWithValue("UserName", textBox1.Text);
            komut.Parameters.AddWithValue("User_Password", textBox2.Text);
            komut.Parameters.AddWithValue("EMail", textBox3.Text);
          

            komut.ExecuteNonQuery();
            MessageBox.Show("Sayın " + textBox1.Text + "; Şifreniz Başarılı Bir Şekilde Güncellenmiştir.");
            baglanti.Close();
           
            Form2 form2=new Form2();
            form2.Show();
            this.Hide();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int birinci = random.Next(1, 9);
            int ikinci = random.Next(1, 9);
            int ucuncu = random.Next(1, 9);
            char dorduncu = Convert.ToChar(random.Next(65, 91));
            char besinci = Convert.ToChar(random.Next(65, 91));
            char altinci = Convert.ToChar(random.Next(65, 91));
            char yedinci = Convert.ToChar(random.Next(65, 91));
            textBox2.Text = birinci.ToString() + dorduncu.ToString() + ikinci.ToString() + altinci.ToString() + yedinci.ToString() + besinci.ToString() + ucuncu.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form2 form2=new Form2();
            form2.Show();
            this.Hide();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }
    }
}
