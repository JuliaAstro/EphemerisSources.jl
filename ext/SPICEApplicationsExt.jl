"""
Construct binary ephemeris files from Horizons CSV-formatted ephemeris data.

# Extended Help

## Exports

$(EXPORTS)

## Imports

$(IMPORTS)
"""
module SPICEApplicationsExt 

using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)
                                         $(DOCSTRING)
                                         """

@template (TYPES, CONSTANTS) = """
                               $(TYPEDEF)
                               $(DOCSTRING)
                               """

end