using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace Link.Security.Cryptography
{
    /// <summary>
    /// Provides methods for encrypting and decrypting clear texts.
    /// </summary>
    public static class Encryptor
    {
        /// <summary>
        /// Encrypts a clear text using specified password and salt.
        /// </summary>
        /// <param name="clearText">The text to encrypt.</param>
        /// <param name="password">The password to create key for.</param>
        /// <param name="salt">The salt to add to encrypted text to make it more secure.</param>
        public static string Encrypt(string clearText, string password, byte[] salt)
        {
            return Convert.ToBase64String(EncryptSecret(clearText, password, salt));
        }

        public static byte[] EncryptIt(string clearText, string password, byte[] salt)
        {
            return EncryptSecret(clearText, password, salt);
        }

        private static byte[] EncryptSecret(string clearText, string password, byte[] salt)
        {
            // Turn text to bytes
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            PasswordDeriveBytes pdb = new PasswordDeriveBytes(password, salt);

            MemoryStream ms = new MemoryStream();
            Rijndael alg = Rijndael.Create();

            alg.Key = pdb.GetBytes(32);
            alg.IV = pdb.GetBytes(16);

            CryptoStream cs = new CryptoStream(ms, alg.CreateEncryptor(), CryptoStreamMode.Write);

            cs.Write(clearBytes, 0, clearBytes.Length);
            cs.Close();

            byte[] EncryptedData = ms.ToArray();
            return EncryptedData;
        }

        /// <summary>
        /// Decrypts an encrypted text using specified password and salt.
        /// </summary>
        /// <param name="cipherText">The text to decrypt.</param>
        /// <param name="password">The password used to encrypt text.</param>
        /// <param name="salt">The salt added to encrypted text.</param>
        public static string Decrypt(string cipherText, string password,
            byte[] salt)
        {
            // Convert text to byte
            byte[] cipherBytes = Convert.FromBase64String(cipherText);

            PasswordDeriveBytes pdb = new PasswordDeriveBytes(password, salt);

            MemoryStream ms = new MemoryStream();
            Rijndael alg = Rijndael.Create();

            alg.Key = pdb.GetBytes(32);
            alg.IV = pdb.GetBytes(16);

            CryptoStream cs = new CryptoStream(ms, alg.CreateDecryptor(), CryptoStreamMode.Write);

            cs.Write(cipherBytes, 0, cipherBytes.Length);
            cs.Close();

            byte[] DecryptedData = ms.ToArray();

            return Encoding.Unicode.GetString(DecryptedData);
        }
    }
}
