
// Question 1: search.as button
private function filter() : void
{
    addressCollection.filterFunction = testMatch;
    addressCollection.refresh();
} 

private function testMatch( item : Object ) : Boolean
{
    var searchTerm:String = textFilter.text.toLowerCase();

    return( item.firstname.toLowerCase().search( searchTerm ) != -1 ||
    item.lastname.toLowerCase().search( searchTerm ) != -1 ||
    item.street.toLowerCase().search( searchTerm ) != -1 ||
    item.city.toLowerCase().search( searchTerm ) != -1 ||
    item.state.toLowerCase().search( searchTerm ) != -1 ||
    String( item.zip ).search( searchTerm ) != -1 ||
    item.email.toLowerCase().search( searchTerm ) != -1 ||
    item.phone.toLowerCase().search( searchTerm ) != -1 )
}


// Question 2: (Cancel, delete, email, new) buttons.
import mx.events.CloseEvent;

// "Cancel" button
private function cancelCntact() : void
{
    firstName.text = contactsView.selectedItem.firstname;
    lastName.text = contactsView.selectedItem.lastname;
    streetAddress.text = contactsView.selectedItem.street;
    city.text = contactsView.selectedItem.city;
    state.text = contactsView.selectedItem.state;
    zipCode.text = contactsView.selectedItem.zip;
    eMail.text = contactsView.selectedItem.email;
    phone.text = contactsView.selectedItem.phone;
    accordion.selectedIndex = 0;
}

// "Delete" button
private function deleteContact( event : CloseEvent ) : void
{
    if ( event.detail == Alert.YES )
    {
        if ( accordion.selectedIndex == 2 )
        accordion.selectedIndex = 0;

        addressCollection.removeItemAt( contactsView.selectedIndex );
    }
}

// "E-Mail" button
public function emailContact() : void
{
    var mailURL : URLRequest = new URLRequest( 'mailto:' +
    contactsView.selectedItem.email );

    navigateToURL( mailURL, "_self" );
}

// "New" button
private function newContact() : void
{
    addressCollection.addItem( {
    firstname : 'New', lastname : 'Contact',
    street : null, city : null, state : null,
    zip : null, email : null, phone : null } );
    contactsView.selectedIndex = addressCollection.length;
    accordion.selectedIndex = 2;
}


