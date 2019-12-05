<?php

declare(strict_types=1);

namespace KejawenLab\Semart\Skeleton\Util;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

/**
 * @author Muhamad Surya Iksanudin <surya.iksanudin@gmail.com>
 */
class UtilExtension extends AbstractExtension
{
    public function getFunctions(): array
    {
        return [
            new TwigFunction('month_to_text', [$this, 'monthToText']),
        ];
    }

    public function monthToText(int $month): string
    {
        $monthText = [
            'januari',
            'februari',
            'maret',
            'april',
            'mei',
            'juni',
            'juli',
            'agustus',
            'september',
            'oktober',
            'november',
            'desember',
        ];

        return $monthText[$month -1];
    }
}
