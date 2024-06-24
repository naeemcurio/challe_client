<?php

namespace App\Enums;

enum WalletEnums: string
{
    case WALLET1 = 'wallet_1'; //winning wallet
    case WALLET2 = 'wallet_2';//challenge creator wallet
    case WALLET3 = 'wallet_3';//admin wallet

    /**
     * Check if a given value is a valid enum case.
     */
    public static function isValid(string $type): bool
    {
        foreach (self::cases() as $case) {
            if ($case->value === $type) {
                return true;
            }
        }

        return false;
    }
}
