using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Synchronic_World
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together
    [ServiceContract]
    public interface IPersonService
    {
        [OperationContract]
        Person AddNewPerson(string name,string nickname,string password);
        [OperationContract]
        Person EditPerson(int id, string name, string nickname, string password);
        [OperationContract]
        Person RetrievePerson(int id);
        [OperationContract]
        IQueryable<Person> RetrieveAllPerson();
        [OperationContract]
        Person RemovePerson(int id);
    }

}

