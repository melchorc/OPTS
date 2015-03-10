using System;

namespace Four.Entity
{
    public class ENUser : ENMASTER
    {
        public ENUser() { }

        #region Properties

        public string User_Name
        {
            get;
            set;
        }

        public string User_LName
        {
            get;
            set;
        }

        public string User_FName
        {
            get;
            set;
        }

        public int User_HouseNo
        {
            get;
            set;
        }

        public string User_SPS
        {
            get;
            set;
        }

        public int User_Loc
        {
            get;
            set;
        }

        public byte[] User_Password
        {
            get;
            set;
        }

        public int User_Landline
        {
            get;
            set;
        }

        public long User_Mobile
        {
            get;
            set;
        }

        public string User_Email
        {
            get;
            set;
        }

        public int User_AccessLevel
        {
            get;
            set;
        }

        public string AccessLevel_Desc
        {
            get;
            set;
        }

        #endregion
    }
}