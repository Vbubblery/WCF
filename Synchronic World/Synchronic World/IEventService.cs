using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Synchronic_World
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IEventService" in both code and config file together.
    [ServiceContract]
    public interface IEventService
    {
        [OperationContract]
        Event AddNewEvent(string name, string address, string description, DateTime date, DateTime time, string eventType);
        [OperationContract]
        IEnumerable<Event> RetrieveAllEvent();
    }
}
