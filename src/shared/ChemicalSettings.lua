local ChemicalSettings = {
    [1] = {
        ["Name"] = "Hydrated Cobalt Complex Ions in Alcohol Solution",
        ["ButtonName"] = "Cobalt Complex Ions in Alcohol",
        ["Equation"] = "Heat  +  [Co(H2O)6]2+  +  4 Cl-  ⇌  [CoCl4]2-  +  6 H2O",
        ["Initial Color"] = Color3.fromRGB(7, 7, 90),
        ["Buttons"] = {
            {
                ["ButtonName"] = "Add Acetone (C3H6O)",
                ["Color"] = Color3.fromRGB(43, 43, 192), -- Light Blue
                ["Hypothesis"] = "Acetone removes water's ability to form a complex ion with cobalt. This creates more blue ions and should make the solution blue.",
                ["Dialogue"] = "As Acetone is added to the solution, it forms hydrogen bonds with water which removes its ability to form a complex ion with cobalt. As products decrease, the equilibrium shifts the reaction to create more products. It uses more pink ions to create blue ions.",
            },
            {
                ["ButtonName"] = "Add Silver Nitrate (AgNO3)",
                ["Color"] = Color3.fromRGB(239, 73, 57), -- Pink
                ["PrecipitateColor"] = Color3.fromRGB(230, 230, 230),
                ["Hypothesis"] = "A precipitate will form of AgCl. This removes the Chloride ion, increasing the amount of pink ions and turning the solution pink.",
                ["Dialogue"] = "As silver nitrate is added to the system, a precipitate of AgCl forms using up the chloride ions. As these ions are used, reactants are decreasing and equilibrium shifts to produce more reactants. Blue ions are used to create pink ions.",
            },
            {
                ["ButtonName"] = "Add Salt (NaCl)",
                ["Color"] = Color3.fromRGB(68, 68, 165), -- Slightly Blue
                ["PrecipitateColor"] = Color3.fromRGB(230, 230, 230),
                ["Hypothesis"] = "The Chloride ion from salt is a reactant, which will cause the reaction to form more products.",
                ["Dialogue"] = "NaCl is not very soluble in alcohol. Most of it does not dissolve, but the ions which do shift the equilibrium towards the products. As Chloride ions are being added, there are too many reactants, so pink ions will be used to create blue ions. This causes the color to shift slightly blue.",
            },
            {
                ["ButtonName"] = "Add Water",
                ["Color"] = Color3.fromRGB(239, 73, 57), -- Pink
                ["Hypothesis"] = "As more product is added, more reactants will be created and change the color to pink.",
                ["Dialogue"] = "Adding water shifts the equilibrium to the left side in order to counteract the increase of product and create more reactants. This uses blue ions and adds pink ions.",
            },
            {
                ["ButtonName"] = "Add Heat",
                ["Color"] = Color3.fromRGB(43, 43, 192), -- Light Blue
                ["Hypothesis"] = "Adding heat is like adding a reactant. That results in more products being created, turning the solution blue.",
                ["Dialogue"] = "Adding heat shifts the equilibrium to the right. Heat is a reactant so more reactants get used up while more products are being created. The pink ions are being used to create blue ions.",
            },
            {
                ["ButtonName"] = "Remove Heat",
                ["Color"] = Color3.fromRGB(239, 73, 57), -- Pink
                ["Hypothesis"] = "Removing heat is like removing a reactant. That results in more reactants being created, turning the solution turning pink.",
                ["Dialogue"] = "Removing heat shifts the equilibrium to the left. The reaction shifts to counteract the change in temperature, attempting to heat itself up by creating more reactants.",
            }
        },
    },
    [2] = {
        ["Name"] = "Copper (II) Sulfate and Ammonia",
        ["ButtonName"] = "Copper (II) Sulfate and Ammonia",
        ["Equation"] = "Cu2+  +  4 NH3  ⇌  [Cu(NH3)4]2+",
        ["Initial Color"] = Color3.fromRGB(0, 160, 206),
        ["Buttons"] = {
            ["Add Hydrochloric Acid (HCl)"] = {
                ["Color"] = Color3.fromRGB(37, 150, 190), -- Light Blue
                ["Hypothesis"] = "Adding Hydrochloric acid will remove some ammonia which will cause [Cu(NH3)4]2+ to decompose into copper and nitrate, resulting in a lighter blue color.",
                ["Dialogue"] = "The HCl reacts with ammonia to create an ammonium ion which cannot form a complex with copper II. \"Removing\" some ammonia shifts the equilibrium to the left, removing the darker blue colored ion and creating the lighter blue ion at the same time."
            }
        },
    },
    [3] = {
        ["Name"] = "Copper (II) Chloride and Water",
        ["ButtonName"] = "Copper (II) Chloride and Water",
        ["Equation"] = "Heat  +  [Cu(H2O)6]2+  +  4 Cl-  ⇌  [CuCl4]2-  +  6 H2O",
        ["Initial Color"] = Color3.fromRGB(25, 124, 128),
        ["Buttons"] = {
            ["Add Hydrochloric Acid (HCl)"] = {
                ["Color"] = Color3.fromRGB(0, 145, 57), -- Green
                ["Hypothesis"] = "Adding HCl adds Chlorine ions and creates hydronium ions from water. This creates more green ions as more reactants are being added. Therefore, the solution will turn green.",
                ["Dialogue"] = "The solution changes from light blue to green. It also had a yellow phase which is an intermediate step to establish equilibrium, though we weren't able to observe it here. As more reactants have been added and products have been used (water to create hydronium) equilibrium shifts to the right, resulting in more green ions."
            },
            ["Add Water"] = {
                ["Color"] = Color3.fromRGB(16, 149, 194), -- Light Blue
                ["Hypothesis"] = "Adding water will add more products and create more reactants. The light blue ion is a reactant, so it should turn light blue.",
                ["Dialogue"] = "As long as there are more copper II ions for the ammonia to react with, adding more ammonia will remove the precipitate and create a darker blue solution. Adding more ammonia past a dark blue solution makes the solution slightly clearer because ammonia is clear and will not react.",
            },
            {
                ["ButtonName"] = "Add Heat",
                ["Color"] = Color3.fromRGB(37, 170, 160), -- Greenish
                ["Hypothesis"] = "Adding heat should result in more green ions being created as adding heat is like adding a reactant.",
                ["Dialogue"] = "The solution should change from light blue to green as the equilibrium shifts to the right. Those are the expected results, however since we are performing the experiment in water, we aren't able to make drastic changes to temperature so it is less pronounced.",
            },
            {
                ["ButtonName"] = "Remove Heat",
                ["Color"] = Color3.fromRGB(22, 130, 160), -- Greenish
                ["Hypothesis"] = "Removing heat should result in more blue ions being created as adding heat is like adding a reactant.",
                ["Dialogue"] = "The solution changes from green to light blue because the equilibrium shifts to the left. As heat is being removed, the equilibrium acts to counteract the change and produces more heat, favoring the left side. Since we are performing the experiment in water, we aren't able to make drastic changes to temperature so it is less pronounced.",
            },
        },
    },
    [5] = {
        ["Name"] = "Iron (III) Nitrate and Potassium Thiocyanate",
        ["ButtonName"] = "Iron (III) Nitrate and Potassium Thiocyanate",
        ["Equation"] = "Fe3+  +  SCN-  ⇌  FeSCN2+  +  Heat",
        ["Initial Color"] = Color3.fromRGB(62, 10, 13),
        ["Buttons"] = {
            {
                ["ButtonName"] = "Add Iron (III) Chloride",
                ["Color"] = Color3.fromRGB(113, 33, 5),
                ["Hypothesis"] = "The original solution of KSCN was clear, but adding Iron (III) Nitrate made it more opaque and red. Adding more Iron seems like it will make the solution more yellow because Iron III is yellow, but also make it more red because FeSCN is red. There should be more atoms which reflect the yellow color.",
                ["Dialogue"] = "The solution turns more opaque and red. Fe (III) is a pale yellow solution, SCN is colorless in water, and FeSCN2+ is dark red. Adding more Iron (III) will shift the reaction to the right and initially turn the solution more yellow, using up iron and thiocyanate, making the solution more red after reaching equilibrium. Though there is more iron III, because red is a stronger color, it is closer to red. The solution does become more pale.",
            },
            {
                ["ButtonName"] = "Add Sodium Phosphate (Na2HPO4)",
                ["Color"] = Color3.fromRGB(192, 176, 118),
                ["Hypothesis"] = "The hydrogen phosphate will use Iron III, so the solution should turn more clear as more SCN is being created. It should also turn more yellow as FeNCS is being used.",
                ["Dialogue"] = "The solution turns yellow. The hydrogen phosphate will react with the iron III to create a new equilibrium which uses up Iron III. Since the iron III is being used, it will initially appear less yellow; however, FeSCN is changing to Iron III and SCN to counteract this change. Though both colored ions are decreasing, iron III decreases by less because it is part of another equilibrium. Red is also a harsher color, so decreasing it and yellow results in the solution turning more yellow."
            }
        },
    },
    [6] = {
        ["Name"] = "Soda Water and Methyl Red",
        ["ButtonName"] = "Soda Water and Methyl Red",
        ["Equation"] = "Heat  +  CO2  (g)  ⇌  CO32- (aq)  +  H+ (aq)",
        ["Initial Color"] = Color3.fromRGB(251, 0, 61),
        ["Buttons"] = {
            {
                ["ButtonName"] = "Remove Carbon Dioxide (CO2)",
                ["Color"] = Color3.fromRGB(245, 130, 0),
                ["Hypothesis"] = "We are releasing CO2. The volume is constant, therefore by PV = nRT, we are decreasing the pressure. Since we are removing CO2 and reducing pressure, the equilibrium should counteract this change. Carbonic acid is changing into CO2. The solution turns more basic and the indicator should turn the color orange.",
                ["Dialogue"] = "The equilibrium is responding both to the reduced forwards reaction rate and the decrease in pressure. To counteract the decrease in pressure, it creates more gas and because there is a lower forward reaction rate, more CO2 are created than Hydrogen ions and carbonic acid until equilibrium is re-established. Since there are less H+ in the new equilibrium, there are more orange indicators, turning the solution orange.",
            }
        },
    }
}

return ChemicalSettings