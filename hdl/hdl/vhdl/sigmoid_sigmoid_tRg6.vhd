-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity sigmoid_sigmoid_tRg6_rom is 
    generic(
             DWIDTH     : integer := 10; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 1024
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of sigmoid_sigmoid_tRg6_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 68=> "0000000000", 69 to 112=> "0000000001", 113 to 138=> "0000000010", 139 to 157=> "0000000011", 
    158 to 171=> "0000000100", 172 to 183=> "0000000101", 184 to 193=> "0000000110", 194 to 201=> "0000000111", 
    202 to 209=> "0000001000", 210 to 216=> "0000001001", 217 to 222=> "0000001010", 223 to 228=> "0000001011", 
    229 to 233=> "0000001100", 234 to 238=> "0000001101", 239 to 242=> "0000001110", 243 to 246=> "0000001111", 
    247 to 250=> "0000010000", 251 to 254=> "0000010001", 255 to 258=> "0000010010", 259 to 261=> "0000010011", 
    262 to 264=> "0000010100", 265 to 267=> "0000010101", 268 to 270=> "0000010110", 271 to 273=> "0000010111", 
    274 to 275=> "0000011000", 276 to 278=> "0000011001", 279 to 281=> "0000011010", 282 to 283=> "0000011011", 
    284 to 285=> "0000011100", 286 to 287=> "0000011101", 288 to 290=> "0000011110", 291 to 292=> "0000011111", 
    293 to 294=> "0000100000", 295 to 296=> "0000100001", 297 to 298=> "0000100010", 299 to 300=> "0000100011", 
    301 => "0000100100", 302 to 303=> "0000100101", 304 to 305=> "0000100110", 306 to 307=> "0000100111", 
    308 => "0000101000", 309 to 310=> "0000101001", 311 => "0000101010", 312 to 313=> "0000101011", 
    314 => "0000101100", 315 to 316=> "0000101101", 317 => "0000101110", 318 to 319=> "0000101111", 
    320 => "0000110000", 321 => "0000110001", 322 to 323=> "0000110010", 324 => "0000110011", 
    325 => "0000110100", 326 to 327=> "0000110101", 328 => "0000110110", 329 => "0000110111", 
    330 => "0000111000", 331 => "0000111001", 332 to 333=> "0000111010", 334 => "0000111011", 
    335 => "0000111100", 336 => "0000111101", 337 => "0000111110", 338 => "0000111111", 
    339 => "0001000000", 340 => "0001000001", 341 => "0001000010", 342 => "0001000011", 
    343 => "0001000100", 344 => "0001000101", 345 => "0001000110", 346 => "0001000111", 
    347 => "0001001000", 348 => "0001001001", 349 => "0001001010", 350 => "0001001011", 
    351 => "0001001100", 352 => "0001001101", 353 => "0001001110", 354 => "0001001111", 
    355 => "0001010001", 356 => "0001010010", 357 => "0001010011", 358 => "0001010100", 
    359 => "0001010101", 360 => "0001010111", 361 => "0001011000", 362 => "0001011001", 
    363 => "0001011010", 364 => "0001011100", 365 => "0001011101", 366 => "0001011110", 
    367 => "0001100000", 368 => "0001100001", 369 => "0001100011", 370 => "0001100100", 
    371 => "0001100101", 372 => "0001100111", 373 => "0001101000", 374 => "0001101010", 
    375 => "0001101011", 376 => "0001101101", 377 => "0001101110", 378 => "0001110000", 
    379 => "0001110001", 380 => "0001110011", 381 => "0001110101", 382 => "0001110110", 
    383 => "0001111000", 384 => "0001111010", 385 => "0001111011", 386 => "0001111101", 
    387 => "0001111111", 388 => "0010000000", 389 => "0010000010", 390 => "0010000100", 
    391 => "0010000110", 392 => "0010001000", 393 => "0010001010", 394 => "0010001011", 
    395 => "0010001101", 396 => "0010001111", 397 => "0010010001", 398 => "0010010011", 
    399 => "0010010101", 400 => "0010010111", 401 => "0010011001", 402 => "0010011011", 
    403 => "0010011101", 404 => "0010011111", 405 => "0010100001", 406 => "0010100100", 
    407 => "0010100110", 408 => "0010101000", 409 => "0010101010", 410 => "0010101100", 
    411 => "0010101111", 412 => "0010110001", 413 => "0010110011", 414 => "0010110110", 
    415 => "0010111000", 416 => "0010111010", 417 => "0010111101", 418 => "0010111111", 
    419 => "0011000010", 420 => "0011000100", 421 => "0011000111", 422 => "0011001001", 
    423 => "0011001100", 424 => "0011001110", 425 => "0011010001", 426 => "0011010011", 
    427 => "0011010110", 428 => "0011011001", 429 => "0011011011", 430 => "0011011110", 
    431 => "0011100001", 432 => "0011100100", 433 => "0011100110", 434 => "0011101001", 
    435 => "0011101100", 436 => "0011101111", 437 => "0011110010", 438 => "0011110101", 
    439 => "0011111000", 440 => "0011111010", 441 => "0011111101", 442 => "0100000000", 
    443 => "0100000011", 444 => "0100000110", 445 => "0100001010", 446 => "0100001101", 
    447 => "0100010000", 448 => "0100010011", 449 => "0100010110", 450 => "0100011001", 
    451 => "0100011100", 452 => "0100100000", 453 => "0100100011", 454 => "0100100110", 
    455 => "0100101001", 456 => "0100101101", 457 => "0100110000", 458 => "0100110011", 
    459 => "0100110111", 460 => "0100111010", 461 => "0100111110", 462 => "0101000001", 
    463 => "0101000101", 464 => "0101001000", 465 => "0101001100", 466 => "0101001111", 
    467 => "0101010011", 468 => "0101010110", 469 => "0101011010", 470 => "0101011101", 
    471 => "0101100001", 472 => "0101100101", 473 => "0101101000", 474 => "0101101100", 
    475 => "0101101111", 476 => "0101110011", 477 => "0101110111", 478 => "0101111011", 
    479 => "0101111110", 480 => "0110000010", 481 => "0110000110", 482 => "0110001010", 
    483 => "0110001101", 484 => "0110010001", 485 => "0110010101", 486 => "0110011001", 
    487 => "0110011101", 488 => "0110100001", 489 => "0110100100", 490 => "0110101000", 
    491 => "0110101100", 492 => "0110110000", 493 => "0110110100", 494 => "0110111000", 
    495 => "0110111100", 496 => "0111000000", 497 => "0111000100", 498 => "0111001000", 
    499 => "0111001100", 500 => "0111010000", 501 => "0111010100", 502 => "0111011000", 
    503 => "0111011100", 504 => "0111100000", 505 => "0111100100", 506 => "0111101000", 
    507 => "0111101100", 508 => "0111110000", 509 => "0111110100", 510 => "0111111000", 
    511 => "0111111100", 512 => "1000000000", 513 => "1000000011", 514 => "1000000111", 
    515 => "1000001011", 516 => "1000001111", 517 => "1000010011", 518 => "1000010111", 
    519 => "1000011011", 520 => "1000011111", 521 => "1000100011", 522 => "1000100111", 
    523 => "1000101011", 524 => "1000101111", 525 => "1000110011", 526 => "1000110111", 
    527 => "1000111011", 528 => "1000111111", 529 => "1001000011", 530 => "1001000111", 
    531 => "1001001011", 532 => "1001001111", 533 => "1001010011", 534 => "1001010111", 
    535 => "1001011011", 536 => "1001011110", 537 => "1001100010", 538 => "1001100110", 
    539 => "1001101010", 540 => "1001101110", 541 => "1001110010", 542 => "1001110101", 
    543 => "1001111001", 544 => "1001111101", 545 => "1010000001", 546 => "1010000100", 
    547 => "1010001000", 548 => "1010001100", 549 => "1010010000", 550 => "1010010011", 
    551 => "1010010111", 552 => "1010011010", 553 => "1010011110", 554 => "1010100010", 
    555 => "1010100101", 556 => "1010101001", 557 => "1010101100", 558 => "1010110000", 
    559 => "1010110011", 560 => "1010110111", 561 => "1010111010", 562 => "1010111110", 
    563 => "1011000001", 564 => "1011000101", 565 => "1011001000", 566 => "1011001100", 
    567 => "1011001111", 568 => "1011010010", 569 => "1011010110", 570 => "1011011001", 
    571 => "1011011100", 572 => "1011011111", 573 => "1011100011", 574 => "1011100110", 
    575 => "1011101001", 576 => "1011101100", 577 => "1011101111", 578 => "1011110010", 
    579 => "1011110101", 580 => "1011111001", 581 => "1011111100", 582 => "1011111111", 
    583 => "1100000010", 584 => "1100000101", 585 => "1100000111", 586 => "1100001010", 
    587 => "1100001101", 588 => "1100010000", 589 => "1100010011", 590 => "1100010110", 
    591 => "1100011001", 592 => "1100011011", 593 => "1100011110", 594 => "1100100001", 
    595 => "1100100100", 596 => "1100100110", 597 => "1100101001", 598 => "1100101100", 
    599 => "1100101110", 600 => "1100110001", 601 => "1100110011", 602 => "1100110110", 
    603 => "1100111000", 604 => "1100111011", 605 => "1100111101", 606 => "1101000000", 
    607 => "1101000010", 608 => "1101000101", 609 => "1101000111", 610 => "1101001001", 
    611 => "1101001100", 612 => "1101001110", 613 => "1101010000", 614 => "1101010011", 
    615 => "1101010101", 616 => "1101010111", 617 => "1101011001", 618 => "1101011011", 
    619 => "1101011110", 620 => "1101100000", 621 => "1101100010", 622 => "1101100100", 
    623 => "1101100110", 624 => "1101101000", 625 => "1101101010", 626 => "1101101100", 
    627 => "1101101110", 628 => "1101110000", 629 => "1101110010", 630 => "1101110100", 
    631 => "1101110101", 632 => "1101110111", 633 => "1101111001", 634 => "1101111011", 
    635 => "1101111101", 636 => "1101111111", 637 => "1110000000", 638 => "1110000010", 
    639 => "1110000100", 640 => "1110000101", 641 => "1110000111", 642 => "1110001001", 
    643 => "1110001010", 644 => "1110001100", 645 => "1110001110", 646 => "1110001111", 
    647 => "1110010001", 648 => "1110010010", 649 => "1110010100", 650 => "1110010101", 
    651 => "1110010111", 652 => "1110011000", 653 => "1110011010", 654 => "1110011011", 
    655 => "1110011100", 656 => "1110011110", 657 => "1110011111", 658 => "1110100001", 
    659 => "1110100010", 660 => "1110100011", 661 => "1110100101", 662 => "1110100110", 
    663 => "1110100111", 664 => "1110101000", 665 => "1110101010", 666 => "1110101011", 
    667 => "1110101100", 668 => "1110101101", 669 => "1110101110", 670 => "1110110000", 
    671 => "1110110001", 672 => "1110110010", 673 => "1110110011", 674 => "1110110100", 
    675 => "1110110101", 676 => "1110110110", 677 => "1110110111", 678 => "1110111000", 
    679 => "1110111001", 680 => "1110111010", 681 => "1110111011", 682 => "1110111100", 
    683 => "1110111101", 684 => "1110111110", 685 => "1110111111", 686 => "1111000000", 
    687 => "1111000001", 688 => "1111000010", 689 => "1111000011", 690 => "1111000100", 
    691 to 692=> "1111000101", 693 => "1111000110", 694 => "1111000111", 695 => "1111001000", 
    696 => "1111001001", 697 to 698=> "1111001010", 699 => "1111001011", 700 => "1111001100", 
    701 to 702=> "1111001101", 703 => "1111001110", 704 => "1111001111", 705 to 706=> "1111010000", 
    707 => "1111010001", 708 to 709=> "1111010010", 710 => "1111010011", 711 to 712=> "1111010100", 
    713 => "1111010101", 714 to 715=> "1111010110", 716 => "1111010111", 717 to 718=> "1111011000", 
    719 to 720=> "1111011001", 721 to 722=> "1111011010", 723 => "1111011011", 724 to 725=> "1111011100", 
    726 to 727=> "1111011101", 728 to 729=> "1111011110", 730 to 731=> "1111011111", 732 to 733=> "1111100000", 
    734 to 736=> "1111100001", 737 to 738=> "1111100010", 739 to 740=> "1111100011", 741 to 742=> "1111100100", 
    743 to 745=> "1111100101", 746 to 748=> "1111100110", 749 to 750=> "1111100111", 751 to 753=> "1111101000", 
    754 to 756=> "1111101001", 757 to 759=> "1111101010", 760 to 762=> "1111101011", 763 to 765=> "1111101100", 
    766 to 769=> "1111101101", 770 to 773=> "1111101110", 774 to 777=> "1111101111", 778 to 781=> "1111110000", 
    782 to 785=> "1111110001", 786 to 790=> "1111110010", 791 to 795=> "1111110011", 796 to 801=> "1111110100", 
    802 to 807=> "1111110101", 808 to 814=> "1111110110", 815 to 822=> "1111110111", 823 to 830=> "1111111000", 
    831 to 840=> "1111111001", 841 to 852=> "1111111010", 853 to 866=> "1111111011", 867 to 885=> "1111111100", 
    886 to 911=> "1111111101", 912 to 955=> "1111111110", 956 to 1023=> "1111111111" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity sigmoid_sigmoid_tRg6 is
    generic (
        DataWidth : INTEGER := 10;
        AddressRange : INTEGER := 1024;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of sigmoid_sigmoid_tRg6 is
    component sigmoid_sigmoid_tRg6_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    sigmoid_sigmoid_tRg6_rom_U :  component sigmoid_sigmoid_tRg6_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


