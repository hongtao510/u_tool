
Module General_Vars

   ! if need to edit this file, EDIT GENRAL.F9X
   ! general.f90 is generated by xcoco.

   Implicit None
   Private
   Public :: przm_id

   Integer, Parameter, Public :: Double = Kind(1.0d0)
   Real,    Parameter, Public :: Pi = 3.14159265358979

   ! Maximum Windows file name length is 256 characters.
   Integer, Parameter, Public :: MaxFileNameLen = 300

   ! The przm version number appeared twice, once in
   ! a variable, the other hardwired. We are moving
   ! the version variable here, so that it can be shared.
   ! We are also changing its type from real to character.
   !
   ! Propagate changes in "PRZM_version" to "general.90x" and "version.rcx"

   Character(Len=*), Parameter, Public :: PRZM_version = '3.12.3 (May 2006)'

   ! Maximum number of chemicals
   Integer, Parameter, Public :: MaxChems = 3

   ! See record 32b: values for MSFlg
   ! MS_Absolute_FC: reference soil moisture is absolute to field capacity (FC)
   ! MS_Relative_FC: reference soil moisture is relative to FC
   Integer, Parameter, Public :: MS_Absolute_FC = 1
   Integer, Parameter, Public :: MS_Relative_FC = 2

Contains

   Subroutine przm_id(Uout, Mod_Id)

      Implicit None
      Integer,          Intent(In) :: Uout   ! Output unit number
      Character(Len=*), Intent(In) :: Mod_Id ! Line identifier

      Integer :: i

      ! Each line of output should contain the leading label Mod_Id

      Write(Uout, 2000) Mod_Id, &
            Mod_Id, Trim(PRZM_version)
2000  Format(1x, a3, ' Pesticide Root Zone Model (PRZM)', /, &
            1x, a3, ' Release ', a)

      Write(Uout, 2010) (Mod_Id, i=6,19)
2010  Format( 1x,a3,1x, & !(6)
            /,1x,a3,1x,'For technical support contact:', & !(7)
            /,1x,a3,1x,'   Center for Exposure Assessment Modeling (CEAM)', & !(8)
            /,1x,a3,1x,'   National Exposure Research Laboratory - ', &
            'Ecosystems Research Division', & !(9)
            /,1x,a3,1x,'   Office of Research and Development (ORD)', & !(10)
            /,1x,a3,1x,'   U.S. Environmental Protection Agency (U.S. EPA)', & !(11)
            /,1x,a3,1x,'   960 College Station Road', & !(12)
            /,1x,a3,1x,'   Athens, Georgia (GA) 30605-2700', & !(13)
            /,1x,a3,1x, & !(14)
            /,1x,a3,1x,'   Voice: (706) 355-8400', & !(15)
            /,1x,a3,1x,'   Fax: (706) 355-8302', & !(16)
            /,1x,a3,1x,'   Web: http://www.epa.gov/ceampubl/', & !(17)
            /,1x,a3,1x,'   E-mail: ceam@epamail.epa.gov', & !(18)
            /,1x,a3,1x) !(19)

   End Subroutine przm_id

End Module General_Vars

