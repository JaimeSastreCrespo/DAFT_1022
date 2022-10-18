'''
This is the main python file where the logic and practice for the fight simulator lives.

'''
'''we delete the library below because it was useles'''
# from curses import def_prog_mode 

from attack import Attack   #from my python file created as attack, import the class Attack 
from pokemon import Pokemon  #from my python file created as pokemon, import the class Pokemon 
import random    # you're gonna need the library random to be able to choose random attacks for each pokemon
import copy    # to give the possibilitie to the second player to choose the same pokemon as the first player, we have to import this library to make a deepcopy of the list of pokemons
import informpoke 

# Type effectiveness chart/array. We'll use this in the function get_effectiveness to match the 'tipos' of pokemons from the list below with all the pokemons created as a object of the class pokemon.
pkm_tipos = ["Normal", "Fire", "Water", "Electric", "Grass", "Ice",
                 "Fighting", "Poison", "Ground", "Flying", "Psychic",
                 "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"]


def get_effectiveness(att: Attack, pkm_def: Pokemon):
    '''
    This calculates the effectiveness of a given move on a defending pokemon
    '''
    att_indx = pkm_tipos.index(att.tipo)
    def_indx = pkm_tipos.index(pkm_def.tipo)
    effect = informpoke.ef_arr[att_indx][def_indx]
    if effect == 2:
        print(att.name + " is super effective against " + pkm_def.name +"!")
    if effect == 1/2:
        print(att.name + " is not very effective against " + pkm_def.name)
    return effect

def calculate_dmg(att: Attack, pkm_att: Pokemon, pkm_def: Pokemon):
    '''
     """Calculates the damage of a given attacking move the player who is attacking taking into account the following 
     arguments:
        - att (Attack): Attack used
        - pkm_att (Pokemon): The Pokemon attacking
        - pkm_def (Pokemon): The Pokemon defending
    Returns:
        int: Returns the damage to the opponent 
    """
    '''
    dmg = ((2*50/5) + 2) * att.damage 

    if att.pores == 0:
        dmg = (dmg * pkm_att.stats[1] / pkm_def.stats[2])/50 + 2

    if att.pores == 1:
        dmg = (dmg * pkm_att.stats[3] /pkm_def.stats[4])/50 + 2

    if att.tipo.lower() == pkm_att.tipo.lower():
        dmg = dmg * 1.5

    dmg = dmg * get_effectiveness(att, pkm_def)
    dmg = dmg * random.randrange(217, 255) /255
    return int(dmg)

# Main code logic

if __name__ == '__main__': 
    print([i.name for i in informpoke.pokelist])

    pkm0 = None
    pkm1 = None

    while pkm0 == None:
        pkm0name = input("Player 1, enter a valid fighter: ").lower()

        for i in informpoke.pokelist:
            if pkm0name == i.name.lower():
                pkm0 = copy.deepcopy(i)
                break

    while pkm1 == None:
        pkm1name = input("Player 2, enter a valid fighter: ").lower()

        for i in informpoke.pokelist:
            if pkm1name == i.name.lower():
                pkm1 = copy.deepcopy(i)
                break

    for i in range(4):
        rand_idx = random.randrange(len(pkm0.allmoves))
        pkm0.moveset.append(pkm0.allmoves.pop(rand_idx))

    print("\n"+pkm0.name + " has the following moves:")
    print([(i.name, i.tipo, i.damage) for i in pkm0.moveset])
        

    for i in range(4):
        rand_idx = random.randrange(len(pkm1.allmoves))
        pkm1.moveset.append(pkm1.allmoves.pop(rand_idx))

    print(pkm1.name + " has the following moves:")
    print([(i.name, i.tipo, i.damage) for i in pkm1.moveset])

    while pkm0.hp > 0 and pkm1.hp > 0:
        # player1 picks attack
        att0 = None
        att1 = None

        while att0 == None:
            att0name = input("\n"+"Player 1 pick a valid move: ").lower()

            for i in pkm0.moveset:
                if att0name == i.name.lower():
                    att0 = i
                    break

        while att1 == None:
            att1name = input("Player 2 pick a valid move: ").lower()

            for i in pkm1.moveset:
                if att1name == i.name.lower():
                    att1 = i
                    break


 # the fastest pokemon attacks first (depending on their attack speed)
        if pkm0.stats[5] > pkm1.stats[5]:
            print("\n"+pkm0.name + " hit " + pkm1.name + " with " + att0.name)
            dmg0 = calculate_dmg(att0, pkm0, pkm1)
            pkm1.hp -= dmg0
            if pkm1.hp <= 0:
                break
            print(pkm1.name +  " hit " + pkm0.name + " with " + att1.name)
            dmg1 = calculate_dmg(att1, pkm1, pkm0)
            pkm0.hp -= dmg1

        else:
            print("\n"+ pkm1.name +  " hit " + pkm0.name + " with " + att1.name)
            dmg1 = calculate_dmg(att1, pkm1, pkm0)
            pkm0.hp -= dmg1
            if pkm0.hp <= 0:
                break
            print(pkm0.name + " hit " + pkm1.name + " with " + att0.name)
            dmg0 = calculate_dmg(att0, pkm0, pkm1)
            pkm1.hp -= dmg0


#print the status of the pokemon (hp  >= 0, the pokemon is alive)
        if pkm0.hp >0 and pkm1.hp > 0:
            print("\n"+pkm0.name + " has remaining HP: " + str(pkm0.hp) + "/" +str(pkm0.stats[0]))
            print(pkm1.name + " has remaining HP: " + str(pkm1.hp)+ "/" +str(pkm1.stats[0]))
            print("_________________________________________________")
            print("\n"+pkm0.name + " has the following moves:")
            print([(i.name, i.tipo, i.damage) for i in pkm0.moveset])
            print(pkm1.name + " has the following moves:")
            print([(i.name, i.tipo, i.damage) for i in pkm1.moveset])

# when a pokemon is dead, display the winner
    if pkm0.hp < 0:
        print("\n"+pkm0.name + " has fainted!")
        print("Winner is " + pkm1.name + "!")
    else:
        print("\n"+pkm1.name + " has fainted!")
        print("Winner is " + pkm0.name + "!")
