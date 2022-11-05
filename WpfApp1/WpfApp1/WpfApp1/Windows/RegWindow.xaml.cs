using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegWindow.xaml
    /// </summary>
    public partial class RegWindow : Window
    {
        public RegWindow()
        {
            InitializeComponent();
        }

        private void autwinBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Hide();
            mainWindow.Show();

        }



        private void regBTN_Click(object sender, RoutedEventArgs e)
        {
            string role = "";
            if (logregTB.Text == "" && passregTB.Text == "")
            {
                MessageBox.Show("Поля не должны быть пустыми.");
                return;
            }
            using (Models.ParfumeriaEntities db = new Models.ParfumeriaEntities())
            {
                var user = db.Users.FirstOrDefault(x => x.login == logregTB.Text &&
                                                      x.password == passregTB.Text);
                if (user != null)
                {
                    MessageBox.Show("Вы уже есть в моей базе, пройдите авторизацию!");
                    return;
                }
                if (logregTB.Text == "Admin")
                {
                    role = "Admin";
                }
                if (logregTB.Text == "Manager")
                {
                    role = "Manager";
                }
                if (logregTB.Text == "User")
                {
                    role = "User";
                }
                db.Users.Add(
                    new Models.Users() { login = logregTB.Text, password = passregTB.Text, role = role });
                db.SaveChanges();
                MessageBox.Show("Регистрация успешна!");
                Windows.SpisokTovarovWindow spisokTovarovWindow = new Windows.SpisokTovarovWindow();
                this.Hide();
                spisokTovarovWindow.Show();
            }
        }
    }
}
