<?php

namespace Tests\Feature\Http\Controllers\Admin;

use App\Models\Challenge;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use JMac\Testing\Traits\AdditionalAssertions;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

/**
 * @see \App\Http\Controllers\Admin\ChallengeController
 */
final class ChallengeControllerTest extends TestCase
{
    use AdditionalAssertions, RefreshDatabase, WithFaker;

    #[Test]
    public function index_displays_view(): void
    {
        $challenges = Challenge::factory()->count(3)->create();

        $response = $this->get(route('challenge.index'));

        $response->assertOk();
        $response->assertViewIs('challenge.index');
        $response->assertViewHas('challenges');
    }


    #[Test]
    public function create_displays_view(): void
    {
        $response = $this->get(route('challenge.create'));

        $response->assertOk();
        $response->assertViewIs('challenge.create');
    }


    #[Test]
    public function store_uses_form_request_validation(): void
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\Admin\ChallengeController::class,
            'store',
            \App\Http\Requests\Admin\ChallengeStoreRequest::class
        );
    }

    #[Test]
    public function store_saves_and_redirects(): void
    {
        $title = $this->faker->sentence(4);
        $price = $this->faker->randomFloat(/** double_attributes **/);
        $user = User::factory()->create();

        $response = $this->post(route('challenge.store'), [
            'title' => $title,
            'price' => $price,
            'user_id' => $user->id,
        ]);

        $challenges = Challenge::query()
            ->where('title', $title)
            ->where('price', $price)
            ->where('user_id', $user->id)
            ->get();
        $this->assertCount(1, $challenges);
        $challenge = $challenges->first();

        $response->assertRedirect(route('challenge.index'));
        $response->assertSessionHas('challenge.id', $challenge->id);
    }


    #[Test]
    public function show_displays_view(): void
    {
        $challenge = Challenge::factory()->create();

        $response = $this->get(route('challenge.show', $challenge));

        $response->assertOk();
        $response->assertViewIs('challenge.show');
        $response->assertViewHas('challenge');
    }


    #[Test]
    public function edit_displays_view(): void
    {
        $challenge = Challenge::factory()->create();

        $response = $this->get(route('challenge.edit', $challenge));

        $response->assertOk();
        $response->assertViewIs('challenge.edit');
        $response->assertViewHas('challenge');
    }


    #[Test]
    public function update_uses_form_request_validation(): void
    {
        $this->assertActionUsesFormRequest(
            \App\Http\Controllers\Admin\ChallengeController::class,
            'update',
            \App\Http\Requests\Admin\ChallengeUpdateRequest::class
        );
    }

    #[Test]
    public function update_redirects(): void
    {
        $challenge = Challenge::factory()->create();
        $title = $this->faker->sentence(4);
        $price = $this->faker->randomFloat(/** double_attributes **/);
        $user = User::factory()->create();

        $response = $this->put(route('challenge.update', $challenge), [
            'title' => $title,
            'price' => $price,
            'user_id' => $user->id,
        ]);

        $challenge->refresh();

        $response->assertRedirect(route('challenge.index'));
        $response->assertSessionHas('challenge.id', $challenge->id);

        $this->assertEquals($title, $challenge->title);
        $this->assertEquals($price, $challenge->price);
        $this->assertEquals($user->id, $challenge->user_id);
    }


    #[Test]
    public function destroy_deletes_and_redirects(): void
    {
        $challenge = Challenge::factory()->create();

        $response = $this->delete(route('challenge.destroy', $challenge));

        $response->assertRedirect(route('challenge.index'));

        $this->assertModelMissing($challenge);
    }
}
