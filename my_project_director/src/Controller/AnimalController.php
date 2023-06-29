<?php

namespace App\Controller;

use App\Entity\Dier;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AnimalController extends AbstractController
{
    #[Route('/', name: 'app_animal')]
    public function index(): Response
    {
        return $this->render('none/index.html.twig', [
            'controller_name' => 'AnimalController',
        ]);
    }
    #[Route('/login', name: 'login')]
    public function login (AuthenticationUtils $authenticationUtils): Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();
        $lastUsername = $authenticationUtils->getLastUsername();
        return $this->render('none/login.html.twig', [
            'controller_name' => 'AnimalController',
            'last_username' => $lastUsername,
            'error' => $error,
        ]);    }


    #[Route('/logout', name: 'logout')]
    public function logout (): Response
    {
        throw new \Exception('Don\'t forget to activate logout in security.yaml');
    }

    #[Route('/member', name: 'app_member')]
    public function member(ManagerRegistry $doctrine): Response
    {
        $animals = $doctrine->getRepository(dier::class)->findAll();
        return $this->render('member/index.html.twig', [
            'controller_name' => 'AnimalController',
            'animals' => $animals,
        ]);
    }
    #[Route('/admin', name: 'app_admin')]
    public function admin(ManagerRegistry $doctrine): Response
    {
        $animals = $doctrine->getRepository(dier::class)->findAll();
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AnimalController',
            'animals' => $animals,
        ]);
    }

    #[Route('/redirect', name: 'redirect')]
    public function redirectAction(Security $security)
    {
        if ($security->isGranted('ROLE_ADMIN')) {
            return $this->redirectToRoute('app_admin');
        }
        if ($security->isGranted('ROLE_MEMBER')) {
            return $this->redirectToRoute('app_member');
        }
        return $this->redirectToRoute('app_default');
    }
}

