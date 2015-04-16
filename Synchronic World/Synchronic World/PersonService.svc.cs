using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Synchronic_World
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class PersonService : IPersonService
    {
        Model1Container context;

        PersonService() 
        {
            context = new Model1Container();
            //Cause some problems. must disable ProxyCreation.(Foreign key)
            context.Configuration.LazyLoadingEnabled = true;
            context.Configuration.ProxyCreationEnabled = false;
        }
        public Person AddNewPerson(string name,string nickname,string password)
        {
            Person p = new Person
            {
                Name = name,
                NickName = nickname,
                Password = password
            };
            context.PersonSet.Add(p);
            context.SaveChanges();
            return p;
        }
        public Person EditPerson(int id,string name,string nickname,string password)
        {
            Person p = context.PersonSet.Find(id);
            p.Name = name;
            p.NickName = nickname;
            p.Password = password;
            context.PersonSet.Attach(p);
            context.SaveChanges();
            return p;
        }
        public Person RetrievePerson(int id)
        {
            return context.PersonSet.Find(id);
        }
        public IQueryable<Person> RetrieveAllPerson()
        {
            IQueryable<Person> ps = context.PersonSet;
            return ps;
        }
        public Person RemovePerson(int id)
        {
            Person p = context.PersonSet.Find(id);
            context.PersonSet.Remove(p);
            context.SaveChanges();
            return p;
        }

    }
}
