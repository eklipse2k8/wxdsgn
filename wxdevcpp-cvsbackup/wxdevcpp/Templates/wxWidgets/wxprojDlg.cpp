//---------------------------------------------------------------------------
//
// Name:        %FILE_NAME%.cpp
// Author:      %AUTHOR_NAME%
// Created:     %DATE_STRING%
//
//---------------------------------------------------------------------------

#include "%FILE_NAME%.h"

////Header Include Start
////Header Include End


//----------------------------------------------------------------------------
// %CLASS_NAME%
//----------------------------------------------------------------------------

////Event Table Start
  BEGIN_EVENT_TABLE(%CLASS_NAME%,wxDialog)	
  EVT_CLOSE(%CLASS_NAME%::%CLASS_NAME%Close)
  END_EVENT_TABLE()
////Event Table End

%CLASS_NAME%::%CLASS_NAME%( wxWindow *parent, wxWindowID id, const wxString &title, const wxPoint &position, const wxSize& size, long style )
    : wxDialog( parent, id, title, position, size, style)
{
    CreateGUIControls();
}

%CLASS_NAME%::~%CLASS_NAME%()
{
} 

void %CLASS_NAME%::CreateGUIControls(void)
{
    ////GUI Items Creation Start
    this->SetSize(8,8,320,334);
    this->SetTitle(wxString("%CLASS_TITLE%"));
    this->Center();
    this->SetIcon(wxNullIcon);
	
    ////GUI Items Creation End
}

void %CLASS_NAME%::%CLASS_NAME%Close(wxCloseEvent& event)
{
    // --> Don't use Close with a wxDialog,
    // use Destroy instead.
    Destroy();
}