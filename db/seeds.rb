EventType.create(name: 'Death')
EventType.create(name: 'Victim')
EventType.create(name: 'Investigator')
EventType.create(name: 'Perpetrator')
EventType.create(name: 'Birth')
EventType.create(name: 'Misc')

# Jack The Ripper
jack = CaseFile.create(name: 'Jack The Ripper', 
                   brief: <<EOT
The name given to an unknown serial killer who stalked
the streets of Whitechapel district of London in 1888.
The name originated in a  letter from someone claiming
to be the murderer. 
                   
# Other Names
- The Whitechapel Murderer
- Leather Apron
                   
# Canonical 5
Though many victims could be attributed to Jack there
are only 5 that the police are certain were Jack's. 
EOT
                  )