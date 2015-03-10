using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BSMaster
/// </summary>
namespace Three.Business
{
    public abstract class BSMASTER
    {
        public BSMASTER() { }

        protected abstract bool validated(ENMASTER info);
        protected abstract bool keyVerify(object key);

        public int Add(ENMASTER info)
        {
            int result = 0;
            if (validated(info))
            {
                result = enAdd(info);
            }
            return result;
        }

        public int Edit(ENMASTER info)
        {
            int result = 0;
            if (validated(info))
            {
                result = enEdit(info);
            }
            return result;
        }

        public int Delete(object key)
        {
            int result = 0;
            if (keyVerify(key))
            {
                result = enDelete(key);
            }
            return result;
        }

        protected abstract int enAdd(ENMASTER info);
        protected abstract int enEdit(ENMASTER info);
        protected abstract int enDelete(object key);
    }
}