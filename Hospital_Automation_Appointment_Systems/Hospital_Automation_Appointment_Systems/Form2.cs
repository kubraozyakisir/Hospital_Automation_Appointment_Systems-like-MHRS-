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
    public partial class Form2 : Form
    {
        SqlConnection baglanti = new SqlConnection("Server=DESKTOP-BQVRHU9\\SQLEXPRESS;DataBase=HastaneProjesi;Integrated Security=true"); //bu bir class
        public Form2()
        {
            InitializeComponent();
        }
        int sayac;

        private void button3_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int birinci = random.Next(1, 9);
            int ikinci = random.Next(1, 9);
            int ucuncu = random.Next(1, 9);
            char dorduncu = Convert.ToChar(random.Next(65, 91));
            char besinci = Convert.ToChar(random.Next(65, 91));
            char altinci = Convert.ToChar(random.Next(65, 91));
            char yedinci = Convert.ToChar(random.Next(65, 91));
            textBox3.Text = birinci.ToString() + dorduncu.ToString() + ikinci.ToString() + altinci.ToString() + yedinci.ToString() + besinci.ToString() + ucuncu.ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
            groupBox2.Visible = false;
            panel1.Visible = true;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglanti;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PUserAdd";  
            baglanti.Open();  
            komut.Parameters.AddWithValue("TC", textBox5.Text);
            if (radioButton1.Checked == true)  
            {
                komut.Parameters.AddWithValue("UserTitle", radioButton1.Text);
                 
            }
            else  
            {
                 
                komut.Parameters.AddWithValue("UserTitle", radioButton2.Text);
            }
            komut.Parameters.AddWithValue("UserName", textBox4.Text);
            komut.Parameters.AddWithValue("User_Password", textBox3.Text);          
            komut.Parameters.AddWithValue("EMail", textBox6.Text);
            komut.Parameters.AddWithValue("Phone", maskedTextBox1.Text);
            komut.ExecuteNonQuery();
            MessageBox.Show("Sayın " + textBox4.Text + "; Kaydınız Başarılı Bir Şekilde Gerçekleşmiştir.");
            baglanti.Close();
            groupBox2.Visible = false; 
            groupBox1.Visible=true;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            sayac++;
           
            if (sayac == 200)
            {
                MessageBox.Show("Kısa süre içerisinde giriş yapmanız gerekmekteydi." + "\n" + " Zaman aşımına uğradı. Tekrar deneyin.");
                this.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("Select *From Users where UserName=@p1 and User_Password=@p2 and UserTitle=@p3", baglanti);
            komut.Parameters.AddWithValue("@p1", textBox1.Text);
            komut.Parameters.AddWithValue("@p2", textBox2.Text);
            komut.Parameters.AddWithValue("@p3", comboBox1.Text);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                if (comboBox1.Text == "Doktor")
                {
                    Form6 form6 = new Form6();
                    form6.username = textBox1.Text;
                    form6.Show();
                    this.Hide();
                }
                else if (comboBox1.Text == "Hasta")
                {
                    Form5 form5 = new Form5();
                    //form3.UserName = textBox1.Text;  
                    form5.username = textBox1.Text;
                    form5.Show();
                    this.Hide();
                }

            }
            else
            {
                MessageBox.Show("Girmiş olduğunu şifre, kullanıcı adı ve unvanlardan birini veya birkaçını yanlış girdiniz.");
                textBox1.Text = " ";
                textBox2.Text = " ";
                comboBox1.Text = " ";
            }
            baglanti.Close();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            panel1.Visible = false;
            groupBox2.Visible = true;
            groupBox1.Visible = false;
        }

        private void Form2_Load_1(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form3 form3 = new Form3();
            form3.Show();
            this.Hide();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form1 form1=new Form1();
            form1.Show();
            this.Hide();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}
