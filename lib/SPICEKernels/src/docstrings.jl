#
# DocStringExtensions templates!
#

@template (FUNCTIONS, METHODS, MACROS) = """
                                         $(SIGNATURES)

                                         $(DOCSTRING)
                                         """

@template (TYPES, CONSTANTS) = """
                               $(TYPEDEF)

                               $(DOCSTRING)
                               """

@template (DEFAULT,) = """
                      $(DOCSTRING)
                      """